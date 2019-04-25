module Resolvers
  class Users < Base
    type [Types::Objects::UserType], null: false

    def resolve
      User.all.includes(:tasks)
    end
  end
end
