class AddCountryReferenceToBooks < ActiveRecord::Migration[7.1]
  def change
    add_reference :books, :country, null: true, foreign_key: true
  end
end
