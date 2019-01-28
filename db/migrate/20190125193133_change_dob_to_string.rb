class ChangeDobToString < ActiveRecord::Migration[5.2]
  def change
    change_column :comedians, :dob, :string
  end
end
