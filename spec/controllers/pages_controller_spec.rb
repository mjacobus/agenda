require 'spec_helper'

describe PagesController do
  it "inherits from HighVoltage::PagesController" do
    described_class.ancestors.should include(HighVoltage::PagesController)
  end
end
