class AddCountryReferenceToFilms < ActiveRecord::Migration[7.1]
  def change
    add_reference :films, :country, null: true, foreign_key: true
  end
end
