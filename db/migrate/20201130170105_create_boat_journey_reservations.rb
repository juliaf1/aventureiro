class CreateBoatJourneyReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :boat_journey_reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :boat_journey, null: false, foreign_key: true
      t.integer :number_passengers
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
