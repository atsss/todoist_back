# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
