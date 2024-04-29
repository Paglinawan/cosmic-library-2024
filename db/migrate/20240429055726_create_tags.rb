class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags, id: false do |t|
      t.primary_key :id
      t.string :label

      t.timestamps
    end
  end
end
