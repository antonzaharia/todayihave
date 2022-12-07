require 'rails_helper'
require_relative "../helpers"

RSpec.describe 'Posts', type: :request do
  describe 'POST /posts' do
    let(:user) { FactoryBot.create(:user) }
    let(:tag) { FactoryBot.create(:tag) }
    let(:params) do
      {
        post: {
          title: Faker::Lorem.sentence,
          content: Faker::Lorem.paragraph,
          tags: tag.name
        }
      }
    end
    send_signin_request

    it 'should create a new post with given tags' do
      post '/posts', params: params

      expect(Post.last.title).to eq(params[:post][:title])
      expect(Post.last.tags.first.name).to eq(tag.name)
    end

    it 'should create a new post and create new tags' do
      params[:post][:tags] = "#{tag.name}, to_create"
      post '/posts', params: params

      expect(Post.last.title).to eq(params[:post][:title])
      expect(Post.last.tags.first.name).to eq(tag.name)
      expect(Post.last.tags.last.name).to eq('to_create')
    end

    it 'should show an error if no tags are added' do
      params[:post][:tags] = nil
      post '/posts', params: params

      expect(assigns(:post).errors.first.full_message).to eq("Tags can't be blank")
    end

  end
end
