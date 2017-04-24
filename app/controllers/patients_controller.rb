class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]


    #Lists all patients in descening order as well as accommodating search.
  def index
    if params[:clinic].blank?
    @patients = Patient.all.order("created_at DESC").where(["name LIKE ?","%#{params[:search]}%"])
  else
    @clinic_id = Clinic.find_by(name: params[:clinic]).id
    @patients = Patient.where(:clinic_id => @clinic_id).order("created_at DESC")
    end
  end

  def show
  end

    #Method for the new patient ERB view.
  def new
    @patient = current_user.patients.build
    @clinics = Clinic.all.map{ |c| [c.name, c.id] }
  end

    #Method for the CREATE functionality for patients.
    #Redirects user to root if successful, if not renders a new patient form again.
  def create
    @patient = current_user.patients.build(patient_params)
    @patient.clinic_id = params[:clinic_id]

    if @patient.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @clinics = Clinic.all.map{ |c| [c.name, c.id] }
  end

    #Update method that PUTS new information in DB upon save.
  def update
    @patient.clinic_id = params[:clinic_id]
    if @patient.update(patient_params)
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

    #Method for deleting patients.
  def destroy
    @patient.destroy
    redirect_to root_path
  end

  private
    def patient_params
      params.require(:patient).permit(:name, :information, :contactinfo, :clinic_id)
    end

    def find_patient
      @patient = Patient.find(params[:id])
    end
  end
