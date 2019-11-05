module Resolvers
  class Base < GraphQL::Schema::Resolver
    private

    def current_user
      context[:current_user]
    end
  end
end
