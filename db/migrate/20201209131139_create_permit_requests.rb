class CreatePermitRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :permit_requests do |t|
      t.integer :status
      t.date :arrival
      t.date :departure
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end