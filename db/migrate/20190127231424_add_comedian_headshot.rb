class AddComedianHeadshot < ActiveRecord::Migration[5.2]
  def change
    add_column(:comedians, :headshot, :string)
  end
end
