class CreateDisasters < ActiveRecord::Migration[5.0]
  def change
    create_table :disasters do |t|
      t.string :category
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
