# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'passpass' }
  end
end
