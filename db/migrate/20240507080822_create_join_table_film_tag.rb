class CreateJoinTableFilmTag < ActiveRecord::Migration[7.1]
  def change
    create_join_table :films, :tags do |t|
      # t.index [:film_id, :tag_id]
      # t.index [:tag_id, :film_id]
    end
  end
end
