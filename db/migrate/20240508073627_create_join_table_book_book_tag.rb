class CreateJoinTableBookBookTag < ActiveRecord::Migration[7.1]
  def change
    create_join_table :books, :book_tags do |t|
      # t.index [:book_id, :book_tag_id]
      # t.index [:book_tag_id, :book_id]
    end
  end
end
