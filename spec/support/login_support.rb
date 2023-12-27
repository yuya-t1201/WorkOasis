module LoginSupport
  def login(user)
    visit login_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    
    click_button 'login-submit-button'
  end
end
