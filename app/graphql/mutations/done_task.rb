module Mutations
  class DoneTask < Base
    argument :id, ID, required: true

    type Types::Objects::TaskType

    def resolve(id: nil)
      task = Task.find(id)
      task.done!

      task
    end
  end
end
