require 'rails_helper'

RSpec.describe Mutations::CreateTask, type: :graphql do
  let(:user) { create(:user) }
  let(:result) { perform(args: task_params, context: { current_user: user }) }
  let(:task_params) do
    {
      name: 'test',
      due_date: Time.zone.now
    }
  end

  it 'success' do
    expect(result.persisted?).to be_truthy
    expect(result.name).to eq 'test'
    expect(result.due_date.to_date).to eq Time.zone.now.to_date
    expect(result.user).to eq user
  end
end
