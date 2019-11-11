require 'rails_helper'

RSpec.describe Types::Objects::ResultType, type: :graphql do
  let(:attributes) { %w(id score task) }

  it { expect(described_class.fields.keys).to eq attributes }
end
