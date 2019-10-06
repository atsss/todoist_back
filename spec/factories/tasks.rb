# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
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

FactoryBot.define do
  factory :task, class: 'Task' do
    user
    name { Faker::Name.name }
    due_date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1.week) }
  end
end
