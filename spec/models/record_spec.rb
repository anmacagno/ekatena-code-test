require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'associations' do
    it { should have_many(:notifications) }
  end

  describe 'validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:court) }
    it { should validate_presence_of(:actor) }
    it { should validate_presence_of(:defendant) }
    it { should validate_presence_of(:summary) }
  end
end
