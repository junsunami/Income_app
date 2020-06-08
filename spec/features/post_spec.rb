require 'rails_helper'

describe 'Get# Post', type: :controller do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    before do
        login_as(user, :scope => :user)
    end

    it 'ホーム画面' do
        expect(page.status_code).to eq(200)
    end

    describe 'index' do
        it 'show User 時給ログ' do
            visit posts_path
            expect(page).to have_content('writing')
        end
    end
end
