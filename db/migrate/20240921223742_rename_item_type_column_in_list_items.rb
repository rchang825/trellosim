class RenameItemTypeColumnInListItems < ActiveRecord::Migration[7.1]
  def change
    rename_column :list_items, :item_type, :type
  end
end
