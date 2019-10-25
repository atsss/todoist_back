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
  belongs_to :user
  has_many :tag_tasks, dependent: :destroy
  has_many :tags, through: :tag_tasks

  validates :name, :due_date, presence: true
end
