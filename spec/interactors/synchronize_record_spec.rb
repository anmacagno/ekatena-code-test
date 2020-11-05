require 'rails_helper'

RSpec.describe SynchronizeRecord, type: :interactor do
  describe 'organize' do
    it { expect(described_class.organized).to eq([FindRecord, UpdateRecord]) }
  end
end
