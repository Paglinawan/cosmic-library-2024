class DropTagsAndFilmsTags < ActiveRecord::Migration[7.1]
  def up
    drop_table :films_tags if table_exists?(:films_tags)
    drop_table :tags if table_exists?(:tags)
  end

  def down
    create_table :films_tags, id: false, charset: "utf8mb4", collation: "utf8mb4_general_ci" do |t|
      t.bigint :film_id, null: false
      t.bigint :tag_id, null: false
    end

    create_table :tags, charset: "utf8mb4", collation: "utf8mb4_general_ci" do |t|
      t.string :label
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
