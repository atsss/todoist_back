module Mutations
  class CreateTask < BaseMutation
    argument :name, String, required: true
    argument :due_date, GraphQL::Types::ISO8601DateTime, required: true

    type Types::TaskType

    def resolve(name: nil, due_date: nil)
      Task.create!(
        user: context[:current_user],
        name: name,
        due_date: due_date
      )
    end
  end
end
