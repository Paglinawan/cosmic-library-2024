class Publisher < ApplicationRecord
  has_many :books

  validates :label, presence: true
  validates :label_en, presence: true
end
