module Resolvers
  class Task < BaseResolver
    type Types::TaskType, null: true

    argument :id, ID, required: true

    def resolve(id: nil)
      ::Task.where(id: id).first
    end
  end
end
