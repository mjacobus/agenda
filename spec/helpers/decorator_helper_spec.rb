require 'spec_helper'

describe DecoratorHelper do
  describe "#decorate" do
    let(:task) { build(:task) }

    it "returns the correct decorator" do
      expect(helper.decorate(task)).to be_a(TaskDecorator)
    end

    it "assigns the correct object to the decorator" do
      expect(helper.decorate(task).object).to eq(task)
    end

    it "yields the decorator" do
      helper.decorate(task) do |decorator|
        expect(decorator).to be_a(TaskDecorator)
      end
    end
  end
end
