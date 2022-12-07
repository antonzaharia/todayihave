require 'rails_helper'
require_relative '../helpers.rb'

RSpec.feature 'Posts' do
  let(:user) { FactoryBot.create(:user) }
  scenario 'Creating a post' do
    integration_signin(user)

    click_link 'New post'
    fill_in 'post_title', with: 'Test title'
    fill_in 'post_content', with: 'Test content'
    fill_in 'post_tags', with: 'tag1, tag2'

    click_button 'Save'

    expect(current_path).to eq('/dashboard')
    expect(page.find('#post_index')).to have_text('Test title')
    expect(page.find('#post_index')).to have_text('Test content')
  end
end
