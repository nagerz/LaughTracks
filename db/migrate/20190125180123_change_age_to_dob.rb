class ChangeAgeToDob < ActiveRecord::Migration[5.2]
  def change
    rename_column :comedians, :age, :dob
  end
end
