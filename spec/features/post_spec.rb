require 'rails_helper'

describe 'Get# Post' do
    let(:user) { create(:user) }

    before do
        login_as(user, :scope => :user)

        visit root_path
    end

    it 'ホーム画面正常に表示(Postデータ無し)' do
        expect(page).to have_content('Hourly_wageへようこそ')
    end

    it 'ホーム画面正常に表示(Postデータ有り)' do
        post = Post.create(description: "記事", price: "100", elapsed_time: 3600, hourly_wage: 100, user_id: user.id, status: 2)
        visit root_path
        expect(page).to have_content('累計稼働時間')
    end
end
