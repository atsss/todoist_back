require 'rails_helper'

RSpec.describe Types::Objects::UserType, type: :graphql do
  let(:attributes) { %w(id name email tasks) }

  it { expect(described_class.fields.keys).to eq attributes }
end
