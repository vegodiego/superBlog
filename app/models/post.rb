class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :body, length: { minimum: 251 }, presence: true
    validates :title, presence: true
end
