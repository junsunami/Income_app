require 'rails_helper'

describe 'Get# Post', type: :controller do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    before do
        login_user user
    end

    it 'ホーム画面' do
        expect(current_path).to eq(root_path)
    end

    describe 'index' do
        before do
            visit posts_path
        end

        it 'show User 時給ログ' do
            expect(page).to have_content('writing')
        end
    end
end
