class AddIsPublicToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :is_public, :boolean
  end
end
