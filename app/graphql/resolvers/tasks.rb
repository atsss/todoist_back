module Resolvers
  class Tasks < BaseResolver
    type [Types::Objects::TaskType], null: false

    def resolve
      ::Task.all.includes(:user)
    end
  end
end
