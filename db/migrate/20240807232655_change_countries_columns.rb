class ChangeCountriesColumns < ActiveRecord::Migration[7.1]
  def change
    change_column_null :countries, :label, false
    change_column_null :countries, :label_en, false
  end
end
