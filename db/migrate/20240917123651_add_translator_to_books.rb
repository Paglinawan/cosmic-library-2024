class AddTranslatorToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :translator, :string
    add_column :books, :translator_en, :string
  end
end
