class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :description
      t.decimal :fee
      t.boolean :open

      t.timestamps
    end
  end
end
