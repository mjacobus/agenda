require 'spec_helper'

describe User do
  describe '#tasks' do
    it { should have_many(:tasks) }
  end
end
