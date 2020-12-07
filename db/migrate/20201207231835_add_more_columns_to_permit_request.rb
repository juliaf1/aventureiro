class AddMoreColumnsToPermitRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :permit_requests, :first_name, :string
    add_column :permit_requests, :last_name, :string
    add_column :permit_requests, :email, :string
    add_column :permit_requests, :address, :string
    add_column :permit_requests, :phone_number, :string
    add_column :permit_requests, :birth_date, :date
  end
end
