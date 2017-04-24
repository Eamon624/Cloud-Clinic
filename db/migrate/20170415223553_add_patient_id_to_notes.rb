class AddPatientIdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :patient_id, :integer
  end
end
