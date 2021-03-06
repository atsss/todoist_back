module Mutations
  class CreateTask < Base
    argument :name, String, required: true
    argument :due_date, Types::Scalars::DateTime, required: true

    type Types::Objects::TaskType

    def resolve(name: nil, due_date: nil)
      Task.create!(
        user: context[:current_user],
        name: name,
        due_date: due_date
      )
    end
  end
end
