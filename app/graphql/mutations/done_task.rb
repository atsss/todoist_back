module Mutations
  class DoneTask < BaseMutation
    argument :id, ID, required: true

    type Types::Objects::TaskType

    def resolve(id: nil)
      task = Task.find(id)
      task.update!(done_at: Time.zone.now)

      task
    end
  end
end
