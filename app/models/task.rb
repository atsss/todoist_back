# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  name       :string(255)
#  kind       :string(255)
#  hour       :integer
#  minute     :integer
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
  extend Enumerize
  acts_as_paranoid

  belongs_to :user
  has_many :tag_tasks, dependent: :destroy
  has_many :tags, through: :tag_tasks
  has_many :results, dependent: :destroy

  validates :name, :kind, :hour, :minute, presence: true
  validates :hour, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }
  validates :minute, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 60 }

  enumerize :kind,
            in: %w(weekday weekend monday tuesday wednesday thursday friday saturday sunday),
            predicates: true,
            scope: true,
            default: 'weekday'
end
