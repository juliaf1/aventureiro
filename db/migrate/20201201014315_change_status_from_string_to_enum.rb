class ChangeStatusFromStringToEnum < ActiveRecord::Migration[6.0]
  def change
    change_column :boat_journey_reservations, :status, :integer, using: 'status::integer'
    change_column :campsite_reservations, :status, :integer, using: 'status::integer'
  end
end
