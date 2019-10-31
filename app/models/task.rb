# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  name       :string(255)
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_tasks_on_deleted_at  (deleted_at)
#  index_tasks_on_user_id     (user_id)
#

class Task < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :tag_tasks, dependent: :destroy
  has_many :tags, through: :tag_tasks
  has_many :results, dependent: :destroy
  has_one :todays_result,
          -> { merge(Result.for_today) },
          class_name: 'Result'

  validates :name, :duration, presence: true
  validates :duration, numericality: { greater_than_or_equal_to: 0 }

  scope :for_today, -> { joins(:schedules).where(schedules: { kind: Schedule.todays_kinds }) }
  scope :not_done, -> { left_outer_joins(:todays_result).where(results: { id: nil }) }
  scope :order_by_time, -> { joins(:schedules).merge(Schedule.order(:hour, :minute)) }
end
