class AppointmentsController < ApplicationController
  before_action :find_patient
  before_action :find_appointment, only: [:edit, :update, :destroy]

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient_id = @patient.id
    @appointment.user_id = current_user.id

    if @appointment.save
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
  end

  def edit
  end

    def destroy
      @appointment.destroy
      redirect_to patient_path(@patient)
    end

  def update
      if @appointment.update(appointment_params)
        redirect_to patient_path(@patient)
      else
        render 'edit'
      end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :hospital, :department, :info)
    end

    def find_patient
      @patient = Patient.find(params[:patient_id])
    end

    def find_appointment
      @appointment = Appointment.find(params[:id])
    end
  end
