class RemoveCountryAndCountryEnFromFilms < ActiveRecord::Migration[7.1]
  def change
    remove_column :films, :country, :string
    remove_column :films, :country_en, :string
  end
end
