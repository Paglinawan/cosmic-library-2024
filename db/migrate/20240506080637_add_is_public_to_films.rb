class AddIsPublicToFilms < ActiveRecord::Migration[7.1]
  def change
    add_column :films, :is_public, :boolean, default: false
  end
end
