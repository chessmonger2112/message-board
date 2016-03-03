class AddColumnToLike < ActiveRecord::Migration
  def change
    add_column :likes, :message_id, :integer
    add_column :likes, :user_id, :integer
  end
end
