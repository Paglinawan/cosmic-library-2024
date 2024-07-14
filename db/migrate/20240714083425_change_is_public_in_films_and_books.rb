class ChangeIsPublicInFilmsAndBooks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :films, :is_public, from: nil, to: false
    change_column_default :books, :is_public, from: nil, to: false
    change_column_null :films, :is_public, true
    change_column_null :books, :is_public, true
  end
end
