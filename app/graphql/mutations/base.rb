module Mutations
  class Base < GraphQL::Schema::Mutation
    null false

    private

    def current_user
      context[:current_user]
    end
  end
end
