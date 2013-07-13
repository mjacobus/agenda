require 'spec_helper'

describe TasksHelper do
  describe "#tasks_grouped_by_scheduled_date" do
    it "groups by scheduled date" do
      today = create(:task, scheduled_to: '2013-01-02')
      tomorrow = create(:task, scheduled_to: '2013-01-03')
      yesterday = create(:task, scheduled_to: '2013-01-01')

      tasks = Task.all
      helper.tasks_grouped_by_scheduled_date(tasks).should == {
        '2013-01-01' => [yesterday],
        '2013-01-02' => [today],
        '2013-01-03' => [tomorrow],
      }
    end
  end
end
