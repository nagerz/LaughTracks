class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.string :name
      t.integer :run_time
      t.integer :comedian_id

      t.timestamps null: false
    end
  end
end
