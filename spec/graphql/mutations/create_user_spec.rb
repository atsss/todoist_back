require 'rails_helper'

RSpec.describe Mutations::CreateUser, type: :graphql do
  let(:result) { perform(args: user_params) }
  let(:user_params) do
    {
      name: 'Test User',
      auth_provider: {
        email: {
          email: 'email@example.com',
          password: '[omitted]'
        }
      }
    }
  end

  it 'success' do
    expect(result).to be_persisted
    expect(result.name).to eq 'Test User'
    expect(result.email).to eq 'email@example.com'
  end
end
