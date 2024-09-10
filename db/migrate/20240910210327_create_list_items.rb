class CreateListItems < ActiveRecord::Migration[7.1]
  def change
    create_table :list_items do |t|
      t.string :item_type
      t.references :list, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
