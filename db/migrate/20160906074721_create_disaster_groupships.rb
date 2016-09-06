class CreateDisasterGroupships < ActiveRecord::Migration[5.0]
  def change
    create_table :disaster_groupships do |t|
      t.integer :disaster_id
      t.integer :group_id
      t.timestamps
    end
    add_index :disaster_groupships, :disaster_id
    add_index :disaster_groupships, :group_id
  end
end
