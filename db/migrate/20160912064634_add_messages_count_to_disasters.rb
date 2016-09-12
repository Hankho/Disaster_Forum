class AddMessagesCountToDisasters < ActiveRecord::Migration[5.0]
  def change
  	add_column :disasters, :messages_count, :integer , null: false, default: 0 #指定messages_count default等於0
  	add_index :disasters, :messages_count
  end
end
