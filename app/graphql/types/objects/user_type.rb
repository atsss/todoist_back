module Types
  module Objects
    class UserType < Base
      field :id, ID, null: false
      field :name, String, null: false
      field :email, String, null: false
      field :tasks, [TaskType], null: true
    end
  end
end
