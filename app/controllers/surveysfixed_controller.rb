class SurveysfixedController < ApplicationController
    before_action :authenticate_user!
    
    def index
        
    end

    def new
        @survey_fixed = SurveyFixed.new
        @survey_fixed.build_answer
      end


    def create
    @survey_fixed = SurveyFixed.new(survey_fixed_params)
    
    if @survey_fixed.save
        # Redirecionar ou executar ação desejada após salvar
    else
        render :new
    end
    end
    
    private
    
    def survey_fixed_params
        params.require(:survey_fixed).permit(answer_attributes: [
            :patient_id,
            :birth_date,
            :sex,
            :self_perception,
            :night_as_patient,
            :searched_doctor,
            :pain_that_impairs,
            :usage_profile,
            :many_daily_medications,
            :have_diabetes,
            :glycated_hemoglobin,
            :heart_attack,
            :family_history_of_cancer,
            :what_family_cancer,
            :had_cancer,
            :what_your_cancer,
            :treatment_of_depression,
            :memory_disease,
            :jitters_that_impairs,
            :treatment_for_blood_pressure,
            :cholesterol_control,
            :systolic_blood_pressure,
            :total_cholesterol,
            :hdl,
            :abdominal_circumference,
            :smoker,
            :cigarettes_quantity,
            :many_years_smoked,
            :minutes_of_physical_activity,
            :active_sex_life,
            :someone_to_look,
            :who_needs_assistance
          ])
          
    end
end