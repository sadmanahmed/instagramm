class AddImageDataToPics < ActiveRecord::Migration[6.0]
  def change
    add_column :pics, :image_data, :text
  end
end
