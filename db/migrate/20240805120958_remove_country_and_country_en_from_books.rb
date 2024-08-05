class RemoveCountryAndCountryEnFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :country, :string
    remove_column :books, :country_en, :string
  end
end
