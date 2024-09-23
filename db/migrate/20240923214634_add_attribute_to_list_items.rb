class AddAttributeToListItems < ActiveRecord::Migration[7.1]
  def change
    add_column :list_items, :checked, :boolean
  end
end
