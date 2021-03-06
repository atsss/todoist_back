module Mutations
  class UpdateTask < Base
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :due_date, Types::Scalars::DateTime, required: false

    type Types::Objects::TaskType

    def resolve(id: nil, name: nil, due_date: nil)
      task = Task.find(id)
      task.update!({ name: name, due_date: due_date }.compact)

      task
    end
  end
end
