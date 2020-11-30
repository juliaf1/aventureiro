class CreateCampsites < ActiveRecord::Migration[6.0]
  def change
    create_table :campsites do |t|
      t.string :name
      t.text :description
      t.integer :daily_price
      t.string :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
