# == Schema Information
#
# Table name: schedules
#
#  id         :bigint           not null, primary key
#  task_id    :bigint           not null
#  kind       :string(255)
#  hour       :integer
#  minute     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_schedules_on_deleted_at  (deleted_at)
#  index_schedules_on_task_id     (task_id)
#

FactoryBot.define do
  factory :schedule, class: 'schedule' do
    task
    kind { 'everyday' }
    hour { 10 }
    minute { 0 }
  end
end
