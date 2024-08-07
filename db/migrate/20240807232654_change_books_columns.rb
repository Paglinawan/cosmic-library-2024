class ChangeBooksColumns < ActiveRecord::Migration[7.1]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :title_en, false
    change_column_null :books, :author, false
    change_column_null :books, :author_en, false
    change_column_null :books, :publisher_id, false
    change_column_null :books, :country_id, false
    change_column_null :books, :year, false
    change_column_null :books, :is_public, false
  end
end
