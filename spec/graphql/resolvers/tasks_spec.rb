require 'rails_helper'

RSpec.describe Resolvers::Tasks, type: :graphql do
  let!(:tasks) { create_list(:task, 3) }
  let(:result) { perform }

  it do
    tasks.first.done!
    expect(result).to eq tasks.last(2)
  end
end
