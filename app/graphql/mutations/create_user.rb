module Mutations
  class CreateUser < Base
    argument :name, String, required: true

    type Types::Objects::UserType

    def resolve(name: nil)
      User.create!(name: name)
    end
  end
end
