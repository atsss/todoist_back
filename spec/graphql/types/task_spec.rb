require 'rails_helper'

RSpec.describe Types::TaskType, type: :graphql do
  let(:attributes) { %w(id name dueDate doneAt createdAt user) }

  it { expect(described_class.fields.keys).to eq attributes }
end
