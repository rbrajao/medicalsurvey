class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)

    initial = @answer.CalculateInitialScore(answer_params)
    puts "Inicial: #{initial}" 

    #calculate age of the patient
    age = @answer.CalculateAge(answer_params[:birth_date])
    puts age

    ################# hospitalization ###############################
    hospitalization = @answer.CalculateHospitalizationScore(answer_params)
    puts "Hospitalização: #{hospitalization}" 
    case 
    when hospitalization < 0.3
      puts "Hospitalização baixa"
    when hospitalization < 0.4
      puts "Hospitalização intermediária"
    when hospitalization < 0.5
      puts "Hospitalização Intermediária alta"
    else
      puts "Hospitalização alta"
    end


    ################# ABVita ###############################
    abvita = @answer.CalculateABVitaScore(answer_params)
    puts "ABVitaScore: #{abvita}" 
    case 
    when abvita > 50
      puts "Indice abvita alto"
    when abvita >=36
      puts "Indice abvita intermediário - alto"
    when abvita >= 17
      puts "Indice abvita Intermediário"
    else
      puts "Indice abvita baixo"
    end

    ################# Cardio ###############################
    cardio = @answer.CalculateCardiacScore(answer_params)
    puts "Cardio: #{cardio}" 
    
    case 
    when cardio < 10
      puts "Risco cardiovascular baixo"
    when cardio > 20
      puts "Risco cardiovascular alto"
    else
      puts "Risco cardiovascular intermediário"
    end

    ################# Final Score ###############################
    case
    when abvita > 50 || cardio > 20 || hospitalization >= 0.5
      puts "Risco geral alto"
    when abvita >= 36 || hospitalization > 0.4
      puts "Risco geral intermediário alto"
    when abvita >= 17 || cardio > 10 || hospitalization >= 0.3
      puts "Risco geral intermediário"
    when abvita + cardio > 20 + hospitalization == 0
      puts "Idade insuficiente"
    else
      puts "Risco geral baixo"
    end

    # respond_to do |format|
    #   if @answer.save
    #     format.html { redirect_to answer_url(@answer), notice: "Answer was successfully created." }
    #     format.json { render :show, status: :created, location: @answer }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @answer.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to answer_url(@answer), notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:patient_id, :birth_date, :sex, :self_perception, :night_as_patient, :searched_doctor, :pain_that_impairs, :usage_profile, :many_daily_medications, :have_diabetes, :glycated_hemoglobin, :heart_attack, :family_history_of_cancer, :what_family_cancer, :had_cancer, :what_your_cancer, :treatment_of_depression, :memory_disease, :jitters_that_impairs, :treatment_for_blood_pressure, :cholesterol_control, :systolic_blood_pressure, :total_cholesterol, :hdl, :abdominal_circumference, :smoker, :cigarettes_quantity, :many_years_smoked, :minutes_of_physical_activity, :active_sex_life, :someone_to_look, :who_needs_assistance, :high_cholesterol, :bmi_height, :bmi_weight, :age, :bmi_classification, :bmi_value, :initial_score, :hospitalization_score, :abvita_score, :cardio_score, :final_score, :hospitalization_classification, :abvita_classification, :cardio_classification, :final_classification)
    end
end
