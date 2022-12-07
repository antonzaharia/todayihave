require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.create(:user) }

  it 'should be valid with all attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without an username' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with duplicated email' do
    new_user = FactoryBot.build(:user, email: user.email)
    expect(new_user).to_not be_valid
  end
  
  it 'is not valid with duplicated username' do
    new_user = FactoryBot.build(:user, username: user.username)
    expect(new_user).to_not be_valid
  end

  it 'is authenticated with correct password' do
    expect(user.authenticate(user.password)).to eq(user)
  end
end
