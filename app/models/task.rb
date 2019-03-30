# == Schema Information
#
# Table name: tasks
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        not null
#  name       :string(255)
#  due_date   :datetime
#  done_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#

class Task < ApplicationRecord
  belongs_to :user

  validates :name, :due_date, presence: true
end
