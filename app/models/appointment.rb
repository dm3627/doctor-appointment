class Appointment < ApplicationRecord
	belongs_to :doctor
	belongs_to :patient

	validates_presence_of :appointment_date, :appointment_time
end
