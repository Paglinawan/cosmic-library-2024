class Country < ApplicationRecord
  validates :label, presence: true
  validates :label_en, presence: true
end
