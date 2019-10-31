module Resolvers
  class Tasks < Base
    type [Types::Objects::TaskType], null: false

    def resolve
      ::Task
        .where(user: context[:current_user])
        .for_today
        .not_done
        .order_by_time
        .includes(:user, :schedule, :schedules, :tags)
    end
  end
end
