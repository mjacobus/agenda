require 'spec_helper'

describe TaskDecorator do
  describe "status" do
    it "gets the translated value" do
      expect(TaskDecorator.new(Task.new(status: 'open')).status).to eq('Aberto')
      expect(TaskDecorator.new(Task.new(status: 'canceled')).status).to eq('Cancelado')
      expect(TaskDecorator.new(Task.new(status: 'done')).status).to eq('Realizado')
    end
  end
end
