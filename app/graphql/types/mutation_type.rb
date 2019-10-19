module Types
  class MutationType < Types::Objects::Base
    field :create_task, mutation: Mutations::CreateTask
    field :done_task, mutation: Mutations::DoneTask
    field :update_task, mutation: Mutations::UpdateTask
  end
end
