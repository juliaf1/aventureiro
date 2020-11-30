class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :local, :boolean, null: false, default: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :birth_date, :date
    add_column :users, :address, :string
    add_column :users, :bio, :text
  end
end
