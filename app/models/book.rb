class Book < ApplicationRecord
  has_and_belongs_to_many :book_tags
end
