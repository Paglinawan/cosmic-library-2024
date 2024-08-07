class ChangeFilmTagsColumns < ActiveRecord::Migration[7.1]
  def change
    change_column_null :film_tags, :label, false
    change_column_null :film_tags, :label_en, false
  end
end
