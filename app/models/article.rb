class Article < ApplicationRecord

    validates :title, presence: true, length: { minimum: 3}, uniqueness: true
    validates :description, presence: true, length: { minimum: 10}
    
end
