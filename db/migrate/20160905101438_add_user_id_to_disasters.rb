class AddUserIdToDisasters < ActiveRecord::Migration[5.0]
  def change
  	add_column :disasters, :user_id, :integer
  	add_index :disasters, :user_id
  end
end
