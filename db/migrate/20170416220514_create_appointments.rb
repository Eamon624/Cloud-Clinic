class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.text :hospital
      t.text :department
      t.text :info

      t.timestamps
    end
  end
end
