module Types
  class QueryType < Types::BaseObject
    field :tasks, [TaskType], null: false

    def tasks
      Task.all
    end

    field :task, TaskType, null: true do
      argument :id, ID, required: true
    end

    def task(id: nil)
      Task.where(id: id).first
    end

    field :users, [UserType], null: false

    def users
      User.all
    end
  end
end
