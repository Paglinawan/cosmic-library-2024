class CreateJoinTableFilmsFilmTags < ActiveRecord::Migration[7.1]
  def change
    create_join_table :films, :film_tags do |t|
      # t.index [:film_id, :film_tag_id]
      # t.index [:film_tag_id, :film_id]
    end
  end
end
