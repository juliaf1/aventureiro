class CreateCampsiteReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :campsite_reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :campsite, null: false, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.text :description
      t.integer :number_guests
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
