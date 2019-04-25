module Resolvers
  class Tasks < Base
    type [Types::Objects::TaskType], null: false

    def resolve
      ::Task.all.includes(:user)
    end
  end
end
