module Types
  module Objects
    class ScheduleType < Base
      field :id, ID, null: false
      field :kind, String, null: false
      field :hour, Int, null: false
      field :minute, Int, null: false
    end
  end
end
