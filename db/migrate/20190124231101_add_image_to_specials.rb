class AddImageToSpecials < ActiveRecord::Migration[5.2]
  def change
    add_column(:specials, :image, :string)
  end
end
