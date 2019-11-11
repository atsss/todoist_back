require 'rails_helper'

RSpec.describe Resolvers::Tasks, type: :graphql do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let!(:tasks) { create_list(:task, 2, :with_schedule, user: user) }
  let(:result) { perform(context: { current_user: user }) }

  it 'get tasks of current user' do
    create(:task, :with_schedule, user: another_user)

    expect(result).to eq tasks
  end

  it 'get tasks witch is not done' do
    tasks.first.done!(score: 8)

    expect(result).to eq [tasks.last]
  end

  context 'on 11th Nov 2019' do
    before { travel_to('2019-11-11') }

    it 'get tasks witch is for today' do
      tasks.first.schedule.update!(kind: :sunday)

      expect(result).to eq [tasks.last]
    end
  end
end
