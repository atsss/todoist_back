require 'rails_helper'

RSpec.describe Mutations::CreateUser, type: :graphql do
  let(:result) { perform(args: user_params) }
  let(:user_params) do
    {
      name: 'Test User'
    }
  end

  it 'success' do
    expect(result).to be_persisted
    expect(result.name).to eq 'Test User'
  end
end
