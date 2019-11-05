module Mutations
  class CreateResult < Base
    argument :task_id, ID, required: true
    argument :score, Int, required: true

    type Types::Objects::ResultType

    def resolve(task_id: nil, score: nil)
      task = current_user.tasks.where(id: task_id).first

      task.done!(score: score)

      task.todays_result
    end
  end
end
