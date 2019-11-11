require 'rails_helper'

RSpec.describe Types::Objects::TagType, type: :graphql do
  let(:attributes) { %w(id name) }

  it { expect(described_class.fields.keys).to eq attributes }
end
