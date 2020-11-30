class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :min_occupation
      t.integer :max_occupation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
