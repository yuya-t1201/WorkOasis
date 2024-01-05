# spec/system/user_authentication_spec.rb

require 'rails_helper'

RSpec.describe 'ログイン機能', type: :system do
  it 'ログインができる' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123', password_confirmation: 'password123')

    visit login_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password123'

    click_button 'ログイン'

    expect(current_path).to eq(workspaces_path)
  end

  it 'ユーザーを新規登録し、その後ログインできる' do
    visit new_user_path

    fill_in 'user_name', with: 'John Doe'
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'

    click_button 'さあ、始めよう！'

    expect(current_path).to eq(login_path)

    visit login_path

    fill_in 'user_email',  with: 'john@example.com'
    fill_in 'user_password', with: 'password123'

    click_button 'ログイン'
    expect(current_path).to eq(workspaces_path)

    # Add more expectations based on the successful registration behavior if needed
  end

  it '登録した情報とフォーム内容が違う場合、ログインに失敗する' do
    visit new_user_path

    fill_in 'user_name', with: 'John Doe'
    fill_in 'user_email', with: 'john@example.com'
    fill_in 'user_password', with: 'password123'
    fill_in 'user_password_confirmation', with: 'password123'

    click_button 'さあ、始めよう！'

    expect(current_path).to eq(login_path)

    visit login_path

    fill_in 'user_email',  with: 'john@example.co'
    fill_in 'user_password', with: 'password123'

    click_button 'ログイン'
    expect(page).to have_content('ログインできませんでした')
    expect(current_path).to eq(login_path)
  end

end
