# == Schema Information
#
# Table name: results
#
#  id         :bigint           not null, primary key
#  tag_id     :bigint           not null
#  score      :integer          default(0), not null
#  done_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_results_on_tag_id  (tag_id)
#

class Result < ApplicationRecord
  belongs_to :tag

  validates :score, presence: true
end
