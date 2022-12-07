require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject(:tag) { FactoryBot.create(:tag) }

  it 'should be valid with all attributes' do
    expect(tag).to be_valid
  end

  it 'is not valid without a name' do
    tag.name = nil
    expect(tag).to_not be_valid
  end
end
