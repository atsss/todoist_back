# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_one :account, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end
