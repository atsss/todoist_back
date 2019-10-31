# == Schema Information
#
# Table name: results
#
#  id         :bigint           not null, primary key
#  task_id    :bigint           not null
#  score      :integer          default(0), not null
#  done_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_results_on_task_id  (task_id)
#

class Result < ApplicationRecord
  belongs_to :task

  validates :score, presence: true

  scope :for_today, -> do
    where('done_at > ?', Time.current.beginning_of_day)
      .where('done_at < ?', Time.current.end_of_day)
  end

  def done!
    update!(done_at: Time.current)
  end
end
