class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :shop_id
      t.string :title
      t.text :body
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
