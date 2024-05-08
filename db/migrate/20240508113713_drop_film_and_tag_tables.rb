class DropFilmAndTagTables < ActiveRecord::Migration[7.1]
  def up
    # drop_table :films
    # drop_table :tags
  end

  def down
    create_table :films do |t|
      # Filmモデルのテーブル作成時のカラム定義をここに追加する
    end

    create_table :tags do |t|
      # Tagモデルのテーブル作成時のカラム定義をここに追加する
    end
  end
end
