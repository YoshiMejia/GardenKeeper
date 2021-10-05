class CreatePlots < ActiveRecord::Migration[6.1]
  def change
    create_table :plots do |t|
      t.string :vegetation_type
      t.integer :plant_id
      t.integer :user_id
      t.integer :garden_id

      t.timestamps
    end
  end
end
