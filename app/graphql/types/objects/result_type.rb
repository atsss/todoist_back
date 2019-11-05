module Types
  module Objects
    class ResultType < Base
      field :id, ID, null: false
      field :score, Int, null: false
      field :task, TaskType, null: true
    end
  end
end
