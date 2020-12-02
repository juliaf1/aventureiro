class RemoveMinOccupationFromBoats < ActiveRecord::Migration[6.0]
  def change
    remove_column :boats, :min_occupation, :integer
  end
end
