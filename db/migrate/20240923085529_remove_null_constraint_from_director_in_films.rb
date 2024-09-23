class RemoveNullConstraintFromDirectorInFilms < ActiveRecord::Migration[7.1]
  def change
    change_column_null :films, :director, true
    change_column_null :films, :director_en, true
  end
end
