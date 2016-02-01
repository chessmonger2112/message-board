class AddEditedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :edited, :boolean
  end
end
