class CreateBoatJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :boat_journeys do |t|
      t.references :boat, null: false, foreign_key: true
      t.datetime :departure_time
      t.string :travel_duration
      t.integer :price_person

      t.timestamps
    end
  end
end
