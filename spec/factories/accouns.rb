# == Schema Information
#
# Table name: accounts
#
#  id                  :bigint           not null, primary key
#  provider            :string(255)      default("email"), not null
#  uid                 :string(255)      default(""), not null
#  user_id             :bigint           not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#  email               :string(255)
#  tokens              :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_accounts_on_email             (email) UNIQUE
#  index_accounts_on_uid_and_provider  (uid,provider) UNIQUE
#  index_accounts_on_user_id           (user_id)
#

FactoryBot.define do
  factory :account, class: 'Account' do
    user
    email { Faker::Internet.email }
    password { 'passpass' }
  end
end
