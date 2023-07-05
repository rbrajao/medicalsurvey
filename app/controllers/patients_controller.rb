class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]
  before_action :set_event, only: %i[ show edit update destroy new index ]
  before_action :set_organization, only: %i[ show edit update new ]
  before_action :authenticate_user!

  # GET /patients or /patients.json
  def index
      if params[:event_id].present?
        
        @event = Event.find(params[:event_id])
        @patients = @event.patients
      else
        @patients = Patient.all
      end
  
  end

  # GET /patients/1 or /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @user = User.new
  end

  # GET /patients/1/edit
  def edit
    
  end

  # POST /patients or /patients.json
  def create
    
    ActiveRecord::Base.transaction do

      @user = User.new(user_params)
      @patient = Patient.new(patient_params)    
      @patient.user = @user

      respond_to do |format|
        if @user.save && @patient.save
          format.html { redirect_to patient_url(@patient), notice: "Patient was successfully created." }
          format.json { render :show, status: :created, location: @patient }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /patients/1 or /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patient_url(@patient), notice: "Patient was successfully updated." }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1 or /patients/1.json
  def destroy
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url, notice: "Patient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:user_id, :event_id, :name, :birthday, :cpf, :status)
    end

    def user_params
      params.require(:patient).require(:user).permit(:user, :email, :role, :password)
    end

    # def organization_params
    #   params.require(:patient).require(:event).require(:organization).permit(:organization_id)
    # end

    def set_organization
      @organizations = Organization.all
    end

    def set_event
      @events = Event.all
    end
end
