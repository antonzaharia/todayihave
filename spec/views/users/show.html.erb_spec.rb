require 'rails_helper'

describe 'users/show.html.erb' do
    context 'visiting a user show page' do
      it 'displays username and the email' do
        assign(:user, FactoryBot.build(:user, username: 'test', email: 'test@test.com'))
        render

        expect(rendered).to have_text('test')
        expect(rendered).to have_text('test@test.com')
      end
    end
  end
