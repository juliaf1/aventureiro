class CreateFullPeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :full_periods do |t|
      t.references :campsite, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end