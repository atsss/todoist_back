module Resolvers
  class Tasks < Base
    type [Types::Objects::TaskType], null: false

    def resolve
      ::Task
        .where(user: context[:current_user])
        .not_done
        .includes(:user)
    end
  end
end
