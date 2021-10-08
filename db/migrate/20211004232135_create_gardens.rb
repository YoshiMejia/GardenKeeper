class CreateGardens < ActiveRecord::Migration[6.1]
  def change
    create_table :gardens do |t|
      t.string :address
      t.integer :user_id
      t.integer :plant_id

      t.timestamps
    end
  end
end
