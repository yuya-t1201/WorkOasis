require 'rails_helper'

RSpec.describe 'ワークスペース新規登録', type: :system do
    before do
        user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password123', password_confirmation: 'password123')

        visit login_path

        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: 'password123'

        click_button 'ログイン'
    end

    it 'ワークスペースの新規登録ができる' do
        click_link '投稿'

        fill_in 'workspace_title', with: "国立国会図書館"
        fill_in 'workspace_address', with: "東京都千代田区永田町１丁目１０−１"
        choose  'library'
        check 'workspace_tag_ids_1'
        select '0~500', from: 'workspace_price'
        fill_in 'workspace_text', with: "最高です"
        click_button '登録する'

        expect(current_path).to eq(show_workspace_path)
    end
end


