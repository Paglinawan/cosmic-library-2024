class Book < ApplicationRecord
  has_and_belongs_to_many :book_tags
  belongs_to :country

  validates :title, presence: true, length: { maximum: 80 }
  validates :author, presence: true, length: { maximum: 80 }
  validates :comment, length: { maximum: 300 }
end
