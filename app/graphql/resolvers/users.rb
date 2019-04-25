module Resolvers
  class Users < BaseResolver
    type [Types::Objects::UserType], null: false

    def resolve
      User.all.includes(:tasks)
    end
  end
end
