require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
    let(:user) { create(:user) }

    describe 'ログイン' do
        context 'フォームの入力値が正常' do
            it 'ログイン処理が成功する' do
                login(user)
                expect(current_path).to eq login_path
            end
        end
    end
end
