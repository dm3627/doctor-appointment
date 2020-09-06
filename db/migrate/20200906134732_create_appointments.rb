class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
    	t.date :appointment_date
    	t.time :appointment_time
    	t.integer :doctor_id
    	t.integer :patient_id
      	t.timestamps
    end
  end
end
