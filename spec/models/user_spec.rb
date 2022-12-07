require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  it 'should be valid with all attributes' do
    expect(user).to be_valid
  end
end
