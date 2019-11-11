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

FactoryBot.define do
  factory :task, class: 'Task' do
    user
    name { Faker::Name.name }
    duration { 8 }

    trait :with_schedule do
      after(:create) { |task, _evaluator| create(:schedule, task: task) }
    end
  end
end
