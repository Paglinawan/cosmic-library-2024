class RemoveNumberFromFilms < ActiveRecord::Migration[7.1]
  def change
    remove_column :films, :number, :integer
  end
end
