# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
# Indexes
#
#  index_tags_on_deleted_at  (deleted_at)
#

class Tag < ApplicationRecord
  acts_as_paranoid

  has_many :tag_tasks, dependent: :destroy
  has_many :tasks, through: :tag_tasks

  validates :name, presence: true
end
