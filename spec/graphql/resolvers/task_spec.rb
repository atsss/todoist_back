require 'rails_helper'

RSpec.describe Resolvers::Task, type: :graphql do
  let(:tasks) { create_list(:task, 2) }
  let(:result) { perform(args: task_params) }

  xdescribe 'success' do
    let(:task_params) do
      {
        id: tasks.first.id
      }
    end

    it { expect(result).to eq tasks.first }
  end

  xdescribe 'failure because no record' do
    let(:task_params) do
      {
        id: tasks.last.id + 1
      }
    end

    it { expect(result).to eq nil }
  end
end
