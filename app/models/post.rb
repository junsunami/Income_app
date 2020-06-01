class Post < ApplicationRecord
    enum status: { 開始前: 0, 完了: 1, 途中: 2}
    belongs_to :user, optional: true
    validates :price, :description,  presence: true


end
