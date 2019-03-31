require 'test_helper'

class Mutations::CreateTaskTest < ActiveSupport::TestCase
  def perform(user: nil, **args)
    Mutations::CreateTask.new(object: nil, context: {}).resolve(args)
  end

  test 'create a new task' do
    user = User.create!(name: 'user', email: 'user@example.com', password: 'passpass')

    task = perform(
      name: 'test',
      due_date: Time.zone.now
    )

    assert task.persisted?
    assert_equal task.name, 'test'
    assert_equal task.due_date.to_date, Time.zone.now.to_date
    assert_equal task.user, user # FIXME
  end
end
