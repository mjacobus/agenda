require 'spec_helper'

describe TaskQuery do
  subject { TaskQuery.new }

  describe "query delegations" do
    it { should respond_to(:to_a) }
    it { should respond_to(:each) }
    it { should respond_to(:each_with_index) }
    it { should respond_to(:all) }
    it { should respond_to(:group_by) }
  end

  describe "#initialize" do
    it "sends sends methods to the TaskQuery object" do
      TaskQuery.any_instance.should_receive(:status).with('value')
      TaskQuery.new do
        status 'value'
      end
    end

    it "returns the TaskQuery object" do
      expect(
        TaskQuery.new do
          status 'value'
        end
      ).to be_a(TaskQuery)
    end
  end

  describe '#build' do
    it "sends sends methods to the TaskQuery object" do
      subject.should_receive(:status).with('value')
      subject.build do |q|
        q.status 'value'
      end
    end

    it "returns the TaskQuery object" do
      expect(
        subject.build do |q|
          q.status 'value'
        end
      ).to be_a(TaskQuery)
    end
  end

  describe "#query" do
    it "sends sends methods to the TaskQuery object" do
      subject.should_receive(:status).with('value')
      subject.query do
        status 'value'
      end
    end

    it "returns the TaskQuery object" do
      expect(
        subject.query do
          status 'value'
        end
      ).to be_a(TaskQuery)
    end
  end

  describe "#to_date" do
    it "converts string to date" do
      today = Date.today
      subject.send(:to_date, today).should eq(today)
      subject.send(:to_date, today.to_s(:db)).should eq(today)
    end
  end

  describe "#status" do
    it "queries by status" do
      open = create(:task, status: 'open')
      done = create(:task, status: 'done')

      expect(
        subject.query do
          status 'open'
        end.to_a
      ).to eq([open])
    end
  end

  describe '#from' do
    it "queries by initial date" do
      unexpected =  create(:task, scheduled_to: 10.day.ago)
      yesterday = create(:task, scheduled_to: 1.day.ago)
      today = create(:task, scheduled_to: 1.day.ago)

      expect(
        subject.query do
          from 1.day.ago.to_date
        end.to_a
      ).to eq([yesterday, today])
    end

    it "queries by initial string date" do
      yesterday = create(:task, scheduled_to: '2001-01-01')
      today = create(:task, scheduled_to: '2001-01-02')
      tomorrow =  create(:task, scheduled_to: '2001-01-03')

      expect(
        subject.query do
          from '2001-01-01'
        end.to_a
      ).to eq([today, tomorrow])
    end
  end

  describe '#from' do
    it "queries by final date" do
      yesterday = create(:task, scheduled_to: 1.day.ago.to_date)
      today = create(:task, scheduled_to: Date.today)
      tomorrow = create(:task, scheduled_to: 1.day.from_now)

      expect(
        subject.query do
          to Date.today
        end.to_a
      ).to eq([yesterday, today])
    end

    it "queries by final string date" do
      yesterday = create(:task, scheduled_to: '2001-01-01')
      today = create(:task, scheduled_to: '2001-01-02')
      tomorrow =  create(:task, scheduled_to: '2001-01-03')

      expect(
        subject.query do
          to '2001-01-02'
        end.to_a
      ).to eq([yesterday, today])
    end
  end

  describe '#matches' do
    it "return matching name" do
      expected = create(:task, name: 'i like abc and fg')
      unexpected = create(:task)
      expect(subject.matches('bc')).to eq([expected])
    end

    it "return matching description" do
      expected = create(:task, description: 'i like abc and fg')
      unexpected = create(:task)
      expect(subject.matches('bc')).to eq([expected])
    end
  end
end