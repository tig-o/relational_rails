class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :difficulty
      t.decimal :length
      t.decimal :elevation_gain
      t.boolean :dogs_allowed

      t.timestamps
    end
  end
end
