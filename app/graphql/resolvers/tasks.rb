module Resolvers
  class Tasks < Base
    type [Types::Objects::TaskType], null: false

    def resolve
      ::Task
        .where(user: current_user)
        .for_today
        .not_done
        .order_by_time
        .includes(:user, :schedules, :tags) # FIXME: schedule のメソッド分 N+1 が発生する
    end
  end
end
