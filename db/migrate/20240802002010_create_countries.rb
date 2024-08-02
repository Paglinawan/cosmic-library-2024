class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :label
      t.string :label_en

      t.timestamps
    end
  end
end
