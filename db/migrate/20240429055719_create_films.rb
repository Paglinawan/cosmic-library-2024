class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films, id: false do |t|
      t.primary_key :id
      t.integer :number
      t.string :title
      t.string :title_en
      t.integer :review_star
      t.string :comment, limit: 100

      t.timestamps
    end
  end
end
