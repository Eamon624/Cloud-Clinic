class AddUserIdToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :user_id, :integer
  end
end
