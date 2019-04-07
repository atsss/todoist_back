module Types
  class TaskType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :due_date, GraphQL::Types::ISO8601DateTime, null: false
    field :done_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :user, UserType, null: false
  end
end
