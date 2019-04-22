module Resolvers
  class Tasks < BaseResolver
    type [Types::TaskType], null: false

    def resolve
      Task.all.includes(:user)
    end
  end
end
