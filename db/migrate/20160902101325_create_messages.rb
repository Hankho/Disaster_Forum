class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
    t.string :message
    t.integer :disaster_id
    t.timestamps
    end
  end
end
