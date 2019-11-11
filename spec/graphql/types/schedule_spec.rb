require 'rails_helper'

RSpec.describe Types::Objects::ScheduleType, type: :graphql do
  let(:attributes) { %w(id kind hour minute) }

  it { expect(described_class.fields.keys).to eq attributes }
end
