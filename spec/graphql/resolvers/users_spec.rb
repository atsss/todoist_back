require 'rails_helper'

RSpec.describe Resolvers::Users, type: :graphql do
  let!(:users) { create_list(:user, 3) }
  let(:result) { perform }

  it { expect(result).to eq users }
end
