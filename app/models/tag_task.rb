# == Schema Information
#
# Table name: tag_tasks
#
#  id         :bigint           not null, primary key
#  tag_id     :bigint           not null
#  task_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_tag_tasks_on_deleted_at          (deleted_at)
#  index_tag_tasks_on_tag_id              (tag_id)
#  index_tag_tasks_on_tag_id_and_task_id  (tag_id,task_id) UNIQUE
#  index_tag_tasks_on_task_id             (task_id)
#

class TagTask < ApplicationRecord
  acts_as_paranoid

  belongs_to :tag
  belongs_to :task

  validates :task_id, uniqueness: { scope: %i(tag_id) }
end
