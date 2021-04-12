class AddImgToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :img, :string
  end
end
