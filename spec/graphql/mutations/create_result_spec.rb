require 'rails_helper'

RSpec.describe Mutations::CreateResult, type: :graphql do
  subject { perform(args: result_params, context: { current_user: user }) }

  let(:task) { create(:task) }
  let(:user) { task.user }
  let(:result_params) do
    {
      task_id: task.id,
      score: 8
    }
  end

  it 'success' do
    expect { subject }.to change { task.results.count }.by(1)

    result = task.todays_result
    expect(result.score).to eq 8
    expect(result.done_at.strftime('%Y/%-m/%-d')).to eq Time.current.strftime('%Y/%-m/%-d')
  end
end
