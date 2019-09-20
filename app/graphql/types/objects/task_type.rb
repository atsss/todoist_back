module Types
  module Objects
    class TaskType < Base
      field :id, ID, null: false
      field :name, String, null: false
      field :due_date, Types::Scalars::DateTime, null: false
      field :done_at, Types::Scalars::DateTime, null: true
      field :created_at, Types::Scalars::DateTime, null: true
      field :user, UserType, null: false
    end
  end
end
