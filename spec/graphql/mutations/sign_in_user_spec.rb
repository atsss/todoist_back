require 'rails_helper'

RSpec.describe Mutations::SignInUser, type: :graphql do
  let(:user) { create(:user) }
  let(:result) { perform(args: sign_in_params) }

  describe 'success' do
    let(:sign_in_params) do
      {
        email: {
          email: user.email,
          password: 'passpass'
        }
      }
    end

    it do
      expect(result[:token]).to be_present
      expect(result[:user]).to eq user
    end
  end

  describe 'failure because no credentials' do
    let(:sign_in_params) { {} }

    it { expect(result).to eq nil }
  end

  describe 'failure because wrong email' do
    let(:sign_in_params) do
      {
        email: {
          email: 'wrong'
        }
      }
    end

    it { expect(result).to eq nil }
  end

  describe 'failure because wrong password' do
    let(:sign_in_params) do
      {
        email: {
          email: user.email,
          password: 'wrong'
        }
      }
    end

    it { expect(result).to eq nil }
  end
end
