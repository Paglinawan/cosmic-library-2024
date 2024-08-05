class AddDetailsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :title_en, :string
    add_column :books, :country, :string
    add_column :books, :country_en, :string
    add_column :books, :comment_en, :string
    add_column :books, :author_en, :string
    add_column :books, :publisher, :string
    add_column :books, :publisher_en, :string
    add_column :books, :quote, :string
    add_column :books, :quote_en, :string
    add_column :books, :year, :integer
  end
end
