require 'spec_helper'

describe Task do
  describe '#name' do
    it { should validate_presence_of(:name) }
  end

  describe "#scheduled_to" do
    it { should validate_presence_of(:scheduled_to) }
  end

  describe '#status' do
    it { should ensure_inclusion_of(:status).in_array(Task::STATUSES) }
  end
end

describe Task do
  describe '.with_status' do
    it "queries by status" do
      expected = create(:task, status: 'open')
      unexpected = create(:task, status: 'canceled')
      Task.with_status(:open).should eq([expected])
    end
  end
end


