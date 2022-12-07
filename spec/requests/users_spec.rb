require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /create' do
    let(:params) do
      {
        user: {
          username: Faker::Internet.username,
          email: Faker::Internet.email,
          password: Faker::Internet.password
        }
      }
    end

    it 'creates a new user' do
      post '/users', params: params

      expect(session[:user_id]).to eq(assigns(:user).id)
      expect(User.first.username).to eq(params[:user][:username])
      expect(User.first.email).to eq(params[:user][:email])
      expect(User.first.authenticate(params[:user][:password])).to eq(User.first)
    end

    it 'validates the new user' do
      FactoryBot.create(:user, username: params[:user][:username])
      post '/users', params: params

      expect(response.status).to eq(422)
      expect(assigns(:user).errors.first.full_message).to eq('Username has already been taken')
    end
  end
end
