require 'rails_helper'

describe 'Get# Post' do
    let(:user) { create(:user) }
    before do
        login_as(user, :scope => :user)

        visit root_path
    end

    it 'ホーム画面' do
        expect(page).to have_content('累計稼働時間')
    end

    describe 'index' do
        it 'show User 時給ログ' do
            visit posts_path
            expect(page).to have_content('時給ログ')
        end
    end
end
