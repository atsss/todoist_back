namespace :batch do
  desc 'set 0 score to tasks which was not done yesterday'
  task set_score_to_overtime_tasks: :environment do
    require 'batches/set_score_to_overtime_tasks'
    Batches::SetScoreToOvertimeTasks.run
  end
end
