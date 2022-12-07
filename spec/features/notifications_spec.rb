require 'rails_helper'
require_relative '../helpers.rb'

RSpec.feature 'Notifications' do
  let(:user) { FactoryBot.create(:user) }

  scenario 'Sending a notification when a user is mentioned' do
    integration_signin(user)

    click_link 'New post'
    fill_in 'post_title', with: 'Test title'
    fill_in 'post_content', with: "Test content and mention @#{user.username}"
    fill_in 'post_tags', with: 'tag1, tag2'

    click_button 'Save'

    visit notifications_path

    expect(page).to have_text("#{user.username} mentioned you in this post")
    expect(page).to have_link('See', href: post_path(Post.last))
  end
end
