class AddIsClassicAndIsFavoriteToBooksAndFilms < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :is_classic, :boolean, default: false, null: false
    add_column :books, :is_favorite, :boolean, default: false, null: false
    add_column :films, :is_classic, :boolean, default: false, null: false
    add_column :films, :is_favorite, :boolean, default: false, null: false
  end
end
