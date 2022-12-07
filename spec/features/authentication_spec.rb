require 'rails_helper'
require_relative '../helpers.rb'

RSpec.feature 'Authentication' do
  scenario 'Allow only authenticated users to dashboard' do
    visit '/dashboard'
    expect(current_path).to eql(root_path)
  end

  let(:user) { FactoryBot.create(:user) }
  scenario 'Logged in users visiting authentication urls' do
    integration_signin(user)

    visit new_users_path
    expect(current_path).to eql(dashboard_path)

    visit new_sessions_path
    expect(current_path).to eql(dashboard_path)

    visit root_path
    expect(current_path).to eql(dashboard_path)
  end
end
