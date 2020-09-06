class Api::AppointmentsController < ApplicationController

	def index
		appointments = current_user.appointments
		render json: appointments
	end

	def create
		@appointment = Appointment.new(appointment_params)
	    begin
	    	@appointment.save!
	    	render json: {appointment: @appointment}
	    rescue => e
	    	render json: {error: @appointment.errors.messages}, status: :unprocessable_entity
	    end
	end

	def show
  		render json: @appointment
	end

	def update
		begin
	    	@appointment.update_attributes!(appointment_params)
	    	render json: {appointment: @appointment}
	    rescue => e
	    	render json: {error: @appointment.errors.messages}, status: :unprocessable_entity
	    end
	end

	def destroy
		begin
			if @appointment.destroy!
	    		render json: {message: 'Appointment has been deleted', appointment: @appointment.id}
	    	end
	    rescue => e
	    	render json: {message: @appointment.errors.messages}, status: :unprocessable_entity
	    end
	end

	private

    def appointment_params
    	params.require(:appointment).permit(:appointment_date, :appointment_time, :patient_id, :doctor_id)
    end

    def find_batch
    	@appointment = Appointment.find(params[:id])
    end

end