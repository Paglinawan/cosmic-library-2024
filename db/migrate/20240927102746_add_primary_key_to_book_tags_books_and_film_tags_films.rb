class AddPrimaryKeyToBookTagsBooksAndFilmTagsFilms < ActiveRecord::Migration[7.1]
  def change
    add_column :book_tags_books, :id, :primary_key

    add_column :film_tags_films, :id, :primary_key
  end
end
