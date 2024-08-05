class Country < ApplicationRecord
  has_many :books
  has_many :films

  validates :label, presence: true
  validates :label_en, presence: true
end
