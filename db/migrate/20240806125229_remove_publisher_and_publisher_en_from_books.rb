class RemovePublisherAndPublisherEnFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :publisher, :string
    remove_column :books, :publisher_en, :string
  end
end
