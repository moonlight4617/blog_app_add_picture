class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.text :details
      t.string :picture
      t.references :owners, foreign_key: true
      t.integer :owner_id

      t.timestamps
    end
  end
end
