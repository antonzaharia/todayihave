def integration_signin(user)
    visit '/sessions/new'

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Sign in'

    expect(page).to have_text("You are siggned in as #{user.username}")
end
