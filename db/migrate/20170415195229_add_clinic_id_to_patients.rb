class AddClinicIdToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :clinic_id, :integer
  end
end
