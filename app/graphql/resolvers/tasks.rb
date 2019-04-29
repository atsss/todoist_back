module Resolvers
  class Tasks < Base
    type [Types::Objects::TaskType], null: false

    def resolve
      ::Task.not_done.includes(:user)
    end
  end
end
