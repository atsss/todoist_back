module Types
  class MutationType < Types::BaseObject
    field :create_task, mutation: Mutations::CreateTask
    field :create_user, mutation: Mutations::CreateUser
    field :done_task, mutation: Mutations::DoneTask
    field :signin_user, mutation: Mutations::SignInUser
    field :update_task, mutation: Mutations::UpdateTask
  end
end
