require 'spec_helper'

describe FormHelper do
  describe "#select_options_for_task_statuses" do
    it "returns translated label along with its values" do
      helper.select_options_for_task_statuses.should =~ [
        [ I18n.t('system.task.status.open'), 'open' ],
        [ I18n.t('system.task.status.canceled'), 'canceled'],
        [ I18n.t('system.task.status.done'), 'done']
      ]
    end
  end
end
