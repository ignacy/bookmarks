class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.string :shortening
      t.integer :site_id

      t.timestamps
    end

    add_index :bookmarks, :site_id
  end
end
