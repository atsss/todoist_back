module Types
  class QueryType < Types::BaseObject
    field :tasks, resolver: Resolvers::Tasks
    field :task, resolver: Resolvers::Task
    field :users, resolver: Resolvers::Users
  end
end
