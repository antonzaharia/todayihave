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
    expect(page.find('#posts')).to have_text('Test title')
    expect(page.find('#posts')).to have_text('Test content')
  end

  scenario 'Updating a post' do
    integration_signin(user)

    click_link 'New post'
    fill_in 'post_title', with: 'Test title'
    fill_in 'post_content', with: 'Test content'
    fill_in 'post_tags', with: 'tag1, tag2'

    click_button 'Save'

    click_on 'Edit'
    fill_in 'post_title', with: 'Edited title'
    fill_in 'post_content', with: 'Edited content'
    fill_in 'post_tags', with: 'tag3'

    click_button 'Save'

    expect(Post.last.title).to eq('Edited title')
    expect(Post.last.content).to eq('Edited content')
  end
end
