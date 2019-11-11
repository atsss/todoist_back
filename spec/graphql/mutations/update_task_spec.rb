require 'rails_helper'

RSpec.describe Mutations::UpdateTask, type: :graphql do
  subject { perform(args: task_params) }

  let(:task) { create(:task) }
  let(:task_params) do
    {
      id: task.id,
      name: 'test',
      due_date: Time.zone.now
    }
  end

  xit 'success' do
    expect { subject }
      .to change(Task, :count).by(0)
      .and change { task.reload.name }.to('test')
      .and change(task, :due_date)
  end
end
