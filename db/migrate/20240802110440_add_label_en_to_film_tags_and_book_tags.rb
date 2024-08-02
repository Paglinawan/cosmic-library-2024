class AddLabelEnToFilmTagsAndBookTags < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:film_tags, :label_en)
      add_column :film_tags, :label_en, :string
    end

    unless column_exists?(:book_tags, :label_en)
      add_column :book_tags, :label_en, :string
    end
  end
end
