require 'rails_helper'

RSpec.describe Types::Objects::TaskType, type: :graphql do
  let(:attributes) { %w(id name duration user schedule tags) }

  it { expect(described_class.fields.keys).to eq attributes }
end
