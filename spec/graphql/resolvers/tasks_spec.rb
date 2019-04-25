require 'rails_helper'

RSpec.describe Resolvers::Tasks, type: :graphql do
  let!(:tasks) { create_list(:task, 3) }
  let(:result) { perform }

  it { expect(result).to eq tasks }
end
