module Types
  class MutationType < Types::BaseObject
    field :create_task, mutation: Mutations::CreateTask
    field :create_user, mutation: Mutations::CreateUser
  end
end
