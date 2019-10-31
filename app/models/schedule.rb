# == Schema Information
#
# Table name: schedules
#
#  id         :bigint           not null, primary key
#  task_id    :bigint           not null
#  kind       :string(255)
#  hour       :integer
#  minute     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_schedules_on_deleted_at  (deleted_at)
#  index_schedules_on_task_id     (task_id)
#

class Schedule < ApplicationRecord
  extend Enumerize
  acts_as_paranoid

  belongs_to :task

  validates :kind, :hour, :minute, presence: true
  validates :hour, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 24 }
  validates :minute, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }

  enumerize :kind,
            in: %w(everyday weekday weekend monday tuesday wednesday thursday friday saturday sunday),
            predicates: true,
            scope: true,
            default: 'everyday'

  scope :for_today, -> { where(kind: todays_kinds) }

  class << self
    def todays_kinds
      kinds = [:everyday]

      case Time.current.wday
      when 0
        kinds.concat(%i(weekend sunday))
      when 1
        kinds.concat(%i(weekday monday))
      when 2
        kinds.concat(%i(weekday tuesday))
      when 3
        kinds.concat(%i(weekday wednesday))
      when 4
        kinds.concat(%i(weekday thursday))
      when 5
        kinds.concat(%i(weekday friday))
      when 6
        kinds.concat(%i(weekend saturday))
      end
    end
  end
end
