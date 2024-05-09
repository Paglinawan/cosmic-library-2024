class Book < ApplicationRecord
  has_and_belongs_to_many :book_tags

  # validates :title, presence: true, length: { maximum: 80 }
  # validates :author, presence: true, length: { maximum: 80 }
  # validates :comment, presence: true, length: { maximum: 300 }
end
