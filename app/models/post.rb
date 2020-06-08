class Post < ApplicationRecord
    enum status: { 開始: 0, 完了: 1, 再開: 2}
    belongs_to :user, optional: true
    validates :price, :description,  presence: true


end
