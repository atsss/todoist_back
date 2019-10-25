# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  account_id :bigint           not null
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_account_id  (account_id)
#

class User < ApplicationRecord
  belongs_to :account
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end
