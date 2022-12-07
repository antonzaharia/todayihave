require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /sessions' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    it 'authenticates the user' do
      post '/sessions', params: params

      expect(session[:user_id]).to eq(user.id)
    end

    it 'shows errors if credentials are wrong' do
      params[:user][:password] = 'wrongpassword'
      post '/sessions', params: params

      expect(response).to have_http_status(:unauthorized)
      expect(session[:user_id]).to eq(nil)
      expect(flash[:message]).to eq('Wrong credentials')
    end
  end

  describe 'DELETE /sessions' do
    let(:user) { FactoryBot.create(:user) }
    before do
      post '/sessions', params: { user: { email: user.email, password: user.password } }
    end
    it 'logs out the user' do
      delete '/sessions'

      expect(session[:user_id]).to eq(nil)
    end
  end

end
