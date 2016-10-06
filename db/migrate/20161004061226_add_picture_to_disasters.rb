class AddPictureToDisasters < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :disasters, :picture
  end
end
