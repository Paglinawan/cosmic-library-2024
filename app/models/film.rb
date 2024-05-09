class Film < ApplicationRecord
  has_and_belongs_to_many :film_tags

  validates :title, presence: true, length: { maximum: 80 }
  validates :title_en, presence: true, length: { maximum: 80 }
  validates :comment, length: { maximum: 300 }
end
