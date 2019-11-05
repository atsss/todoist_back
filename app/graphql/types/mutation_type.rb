module Types
  class MutationType < Types::Objects::Base
    field :create_result, mutation: Mutations::CreateResult

    # FIXME: these are not used
    # field :create_task, mutation: Mutations::CreateTask
    # field :update_task, mutation: Mutations::UpdateTask
  end
end
