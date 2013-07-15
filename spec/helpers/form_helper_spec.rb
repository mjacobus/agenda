require 'spec_helper'

describe FormHelper do
  subject { helper }

  describe "#select_options_for_task_statuses" do
    it "returns translated label along with its values" do
      helper.select_options_for_task_statuses.should =~ [
        [ I18n.t('system.task.status.open'), 'open' ],
        [ I18n.t('system.task.status.canceled'), 'canceled'],
        [ I18n.t('system.task.status.done'), 'done']
      ]
    end
  end

  describe '#date_format' do
    context 'when locale is pt-BR' do
      before { I18n.locale = 'pt-BR' }
      its(:date_format) { should eq('dd/mm/yyyy') }
    end
  end
end
