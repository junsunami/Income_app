require 'rails_helper'

describe '案内' do
  describe 'ホームページ' do
    it '正常に表示' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end