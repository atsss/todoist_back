require 'rails_helper'

RSpec.describe Resolvers::Tasks, type: :graphql do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let!(:tasks) { create_list(:task, 3, user: user) }
  let(:result) { perform(context: { current_user: user }) }

  it 'get tasks of current user' do
    create_list(:task, 2, user: another_user)

    expect(result.count).to eq 3
  end

  it 'get tasks witch is not done' do
    tasks.first.done!

    expect(result).to eq tasks.last(2)
  end
end
