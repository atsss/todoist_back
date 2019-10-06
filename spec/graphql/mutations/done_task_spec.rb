require 'rails_helper'

RSpec.describe Mutations::DoneTask, type: :graphql do
  subject { perform(args: task_params) }

  let(:task) { create(:task) }
  let(:task_params) do
    {
      id: task.id
    }
  end

  it 'success' do
    expect { subject }
      .to change(Task, :count).by(0)
      .and change { task.reload.done_at }.from(nil)
  end
end
