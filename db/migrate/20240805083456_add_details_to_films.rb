class AddDetailsToFilms < ActiveRecord::Migration[7.1]
  def change
    add_column :films, :country, :string
    add_column :films, :country_en, :string
    add_column :films, :comment_en, :string
    add_column :films, :director, :string
    add_column :films, :director_en, :string
    add_column :films, :cast, :string
    add_column :films, :cast_en, :string
    add_column :films, :year, :integer
  end
end
