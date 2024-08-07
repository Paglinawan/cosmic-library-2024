class ChangeFilmsColumns < ActiveRecord::Migration[7.1]
  def change
    change_column_null :films, :title, false
    change_column_null :films, :title_en, false
    change_column_null :films, :director, false
    change_column_null :films, :director_en, false
    change_column_null :films, :country_id, false
    change_column_null :films, :year, false
    change_column_null :films, :is_public, false
  end
end
