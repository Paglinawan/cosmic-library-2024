class CreateFilmTags < ActiveRecord::Migration[7.1]
  def change
    create_table :film_tags do |t|
      t.string :label

      t.timestamps
    end
  end
end
