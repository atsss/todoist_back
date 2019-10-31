module Types
  module Objects
    class TagType < Base
      field :id, ID, null: false
      field :name, String, null: false
    end
  end
end
