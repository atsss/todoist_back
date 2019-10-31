module Types
  module Objects
    class TaskType < Base
      field :id, ID, null: false
      field :name, String, null: false
      field :duration, Int, null: false
      field :user, UserType, null: false
      field :schedule, ScheduleType, null: false
      field :tags, [TagType], null: false
    end
  end
end
