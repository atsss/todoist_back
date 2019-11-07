require 'batch/base'

module Batches
  class SetScoreToOvertimeTasks < Batch::Base
    SCORE_FOR_OVERTIME = 0

    def execute(_args)
      Task.overtime.each { |task| task.results.create!(score: SCORE_FOR_OVERTIME, done_at: Time.current.yesterday.end_of_day) }
    end
  end
end
