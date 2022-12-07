require 'rails_helper'
require_relative '../helpers.rb'

RSpec.describe 'Tags', type: :request do
  describe 'GET /tags/:id' do
    let(:tag) { FactoryBot.create(:tag) }
    let(:first_post) { FactoryBot.create(:post) }
    let(:second_post) { FactoryBot.create(:post) }

    let(:user) { FactoryBot.create(:user) }
    send_signin_request

    it 'lists all posts that has the specific tag' do
      first_post.tags << tag
      second_post.tags << tag
      get "/tags/#{tag.id}"

      expect(assigns(:tag).posts.size).to eq(2)
    end
  end

  describe 'GET /tags' do
    let(:tag) { FactoryBot.create(:tag) }
    let(:second_tag) { FactoryBot.create(:tag) }
    let(:first_post) { FactoryBot.create(:post) }
    let(:second_post) { FactoryBot.create(:post) }

    let(:user) { FactoryBot.create(:user) }
    send_signin_request

    it 'lists all posts that has the specific tag' do
      first_post.tags << tag
      second_post.tags << tag
      get "/tags"

      expect(response.body).to include('2 posts')
      expect(response.body).to include('1 post')
    end
  end
end