class CreateShoeStores < ActiveRecord::Migration[7.0]
  def change
    create_table :shoe_stores do |t|
      t.integer :inventory
      t.references :store, null: false, foreign_key: true
      t.references :shoe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
