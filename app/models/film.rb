class Film < ApplicationRecord
  validates :title, presence: true, length: { maximum: 80 }
  validates :title_en, presence: true, length: { maximum: 80 }
  validates :comment, presence: true, length: { maximum: 300 }
end
