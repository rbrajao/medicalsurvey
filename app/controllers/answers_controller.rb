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
    if current_user.role == "patient" && current_user.patient.answers.present?

      redirect_to advice_path(id: current_user.patient.id), notice: "Questionário já preenchido!"
      puts "entrou no if"
    else
      puts "else"
    end

    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  def create
    
    @answer = Answer.new(answer_params)

    @answer.initial_score = @answer.CalculateInitialScore(answer_params)
    puts "Inicial: #{@answer.initial_score}" 

    #calculate age of the patient
    @answer.age = @answer.CalculateAge(answer_params[:birth_date])

    #BMI values
    @answer.bmi_value = @answer.CalculateBMIValue(@answer.age, answer_params[:bmi_height], answer_params[:bmi_weight])
    @answer.bmi_classification = @answer.CalculateBMIClassification(@answer.age, @answer.bmi_value)

    ################# hospitalization ###############################
    @answer.hospitalization_score = @answer.CalculateHospitalizationScore(answer_params)
    puts "Hospitalização SCORE: #{@answer.hospitalization_score}" 
    case 
    when @answer.hospitalization_score < 0.3
      @answer.hospitalization_classification = "Hospitalização baixa"
    when @answer.hospitalization_score < 0.4
      @answer.hospitalization_classification = "Hospitalização intermediária"
    when @answer.hospitalization_score < 0.5
      @answer.hospitalization_classification = "Hospitalização Intermediária alta"
    else
      @answer.hospitalization_classification = "Hospitalização alta"
    end
    puts "Hospitalização CLASS: #{@answer.hospitalization_classification}"


    ################# ABVita ###############################
    @answer.abvita_score = @answer.CalculateABVitaScore(answer_params)
    puts "ABVitaScore: #{@answer.abvita_score}" 
    case 
    when @answer.abvita_score > 50
      @answer.abvita_classification = "Indice abvita alto"
    when @answer.abvita_score >=36
      @answer.abvita_classification = "Indice abvita intermediário - alto"
    when @answer.abvita_score >= 17
      @answer.abvita_classification = "Indice abvita Intermediário"
    else
      @answer.abvita_classification = "Indice abvita baixo"
    end
    puts "ABVIta Class: #{@answer.abvita_classification}"

    ################# Cardio ###############################
    @answer.cardio_score = @answer.CalculateCardiacScore(answer_params)
    puts "Cardio: #{@answer.cardio_score}"    
    
    case 
    when @answer.cardio_score < 10
      @answer.cardio_classification = "Risco cardiovascular baixo"
    when @answer.cardio_score > 20
      @answer.cardio_classification =  "Risco cardiovascular alto"
    else
      @answer.cardio_classification =  "Risco cardiovascular intermediário"
    end
    puts "Cardio Class: #{@answer.cardio_classification}"

    ################# Final Score ###############################
    case
    when @answer.abvita_score > 50 || @answer.cardio_score > 20 || @answer.hospitalization_score >= 0.5
      @answer.final_classification = "Risco geral alto"
    when @answer.abvita_score >= 36 || @answer.hospitalization_score > 0.4
      @answer.final_classification = "Risco geral intermediário alto"
    when @answer.abvita_score >= 17 || @answer.cardio_score > 10 || @answer.hospitalization_score >= 0.3
      @answer.final_classification = "Risco geral intermediário"
    when @answer.abvita_score + @answer.cardio_score > 20 + @answer.hospitalization_score == 0
      @answer.final_classification = "Idade insuficiente"
    else
      @answer.final_classification = "Risco geral baixo"
    end

    puts "Final score: #{@answer.final_classification}"

    respond_to do |format|
      if @answer.save

        #format.html { redirect_to answer_url(@answer), notice: "Obrigado por preencher o questionário!" }
        format.html { redirect_to advice_path(id: @answer.patient_id), notice: "Obrigado por preencher o questionário!" }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        #format.html { redirect_to answer_url(@answer), notice: "Answer was successfully updated." }
        format.html { redirect_to advice_path(id: @answer.patient_id), notice: "Obrigado por preencher o questionário!" }
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
  

  def advice
    @patient = Patient.find(params[:id])
    
    #@advice_check = Answer.find(params[:id])
    @advice_check = @patient.answers.last

    # Verifica se o ID pertence ao usuário autenticado
    if current_user.role == "patient" && (@advice_check.patient.user_id != current_user.id)
      # Redireciona ou exibe uma mensagem de erro, conforme necessário
      redirect_to root_path, alert: "Acesso não autorizado."
    end

    
    @advice_patient = Advice.new
    @advice_patient.generateAdvice(@patient, @advice_patient)

    @color_hero_hospitalization = "is-info"
    case @advice_check.hospitalization_classification
    when "Hospitalização baixa"
      @color_hero_hospitalization = "is-success"
    when "Hospitalização intermediária"
      @color_hero_hospitalization = "is-warning"
    when "Hospitalização Intermediária alta"
      @color_hero_hospitalization = "is-warning"
    else #"Hospitalização alta"
      @color_hero_hospitalization = "is-danger"
    end

    @color_hero_abvita = "is-info"
    case @advice_check.abvita_classification
    when "Indice abvita alto"
      @color_hero_abvita = "is-danger"
    when "Indice abvita Intermediário"
      @color_hero_abvita = "is-warning"
    when "Indice abvita intermediário - alto"
      @color_hero_abvita = "is-warning"
    else #"Hospitalização alta"
      @color_hero_abvita = "is-success"
    end

    @color_hero_cardio = "is-info"
    case @advice_check.cardio_classification
    when "Risco cardiovascular alto"
      @color_hero_cardio = "is-danger"
    when "Risco cardiovascular intermediário"
      @color_hero_cardio = "is-warning"
    else #"Hospitalização alta"
      @color_hero_abvita = "is-success"
    end

    @color_hero_final = "is-info"
    case @advice_check.final_classification
    when "Risco geral alto"
      @color_hero_final = "is-danger"
    when "Risco geral intermediário"
      @color_hero_final = "is-warning"
    when "Risco geral intermediário alto"
      @color_hero_final = "is-warning"
    else #"Hospitalização alta"
      @color_hero_final = "is-success"
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
