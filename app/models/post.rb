class Post < ApplicationRecord
    belongs_to :user, optional: true
    validates :price, :description,  presence: true
end
