class Post < ApplicationRecord
    enum status: {開始: 0, 中断: 1, 完了: 2, 再開: 3}
    belongs_to :user, optional: true
    validates :price, :description,  presence: true


end
