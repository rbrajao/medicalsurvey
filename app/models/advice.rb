class Advice
    
    attr_accessor :age, :diabetes, :heart_disease, :smoker, :ex_smoker, :hypertension, :more_daily_medications, :treatment_of_depression, :family_history_of_cancer, :had_cancer, :little_physical_activity, :zero_physical_activity, :obesity, :dyslipidemia, :high_utilization_of_health_services, :man, :evaluate_causes_of_hospital_visits, :evaluate_risk_of_hospitalization, :evaluate_references_searches_of_doctors, :evaluate_the_specialties
    attr_accessor :ab_vita_score, :hospitalization_score, :cardiac_score_final, :cardiac_percentage

     #def generateAdvice(question_params, advice)
    def generateAdvice(patient, advice_patient)

        #last answer for the patient
        answer_patient = patient.answers.last

        #advice info
        advice_patient.age = answer_patient.age
        advice_patient.diabetes = answer_patient.have_diabetes === "Diabetes_Sim" ? true : false
        advice_patient.smoker = answer_patient.smoker === "smoker_fumante" ? true : false
        advice_patient.ex_smoker = answer_patient.smoker === "smoker_exfumante" ? true : false
        advice_patient.more_daily_medications = (answer_patient.many_daily_medications === "AteQuatro" || answer_patient.many_daily_medications === "AcimaCinco") ? true : false
        advice_patient.treatment_of_depression = answer_patient.treatment_of_depression === "treatment_of_depression_sim" ? true : false
        advice_patient.man = answer_patient.sex === "Masculino" ? true : false
        advice_patient.evaluate_causes_of_hospital_visits = answer_patient.night_as_patient === "DuasTresVezes" ? true : false
        advice_patient.evaluate_risk_of_hospitalization = answer_patient.night_as_patient === "MaisTresVezes" ? true : false
        advice_patient.evaluate_references_searches_of_doctors = answer_patient.searched_doctor === "sd_QuatroSeisVezes" ? true : false
        advice_patient.evaluate_the_specialties = answer_patient.searched_doctor === "sd_MaiSeisVezes" ? true : false
        advice_patient.family_history_of_cancer = answer_patient.family_history_of_cancer === "family_history_of_cancer_sim" ? true : false
        advice_patient.had_cancer = answer_patient.had_cancer === "had_cancer_sim" ? true : false
        advice_patient.little_physical_activity = answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_menos150"  ? true : false
        advice_patient.zero_physical_activity = answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma"  ? true : false
        advice_patient.obesity = answer_patient.bmi_classification === "BMI_OBESITY" ? true : false
        advice_patient.heart_disease = answer_patient.heart_attack === "heart_attack_sim" ? true : false
        advice_patient.dyslipidemia = answer_patient.cholesterol_control === "cholesterol_control_sim" ? true : false
        advice_patient.hypertension = answer_patient.treatment_for_blood_pressure === "treatment_for_blood_pressure_sim" ? true : false
        advice_patient.high_utilization_of_health_services =  ((advice_patient.evaluate_risk_of_hospitalization === true || advice_patient.evaluate_causes_of_hospital_visits === true) && (advice_patient.evaluate_references_searches_of_doctors===true || advice_patient.evaluate_the_specialties===true)) ? true : false

    end

    def generateAdviceMessages(advice_patient)

        msgAdviceSmoker = advice_patient.smoker === true ? "" : ""
        msgAdviceExSmoker = advice_patient.ex_smoker === true ? "" : ""
        msgAdviceMoreDailyBelow60 = (advice_patient.more_daily_medications===true && advice_patient.age <= 60) ? "" : ""
        msgAdviceMoreDailyUp60 = (advice_patient.more_daily_medications===true && advice_patient.age > 60) ? "" : ""
        msgAdviceTreatmentDepression = advice_patient.treatment_of_depression === true ? "" : ""
        msgAdviceLittlePhysicalActivity = advice_patient.little_physical_activity === true ? "" : ""
        msgAdviceZeroPhysicalActivity = advice_patient.zero_physical_activity === true ? "" : ""
        msgAdviceHadCancer = advice_patient.had_cancer === true ? "" : ""
        msgAdviceFamilyHistoryCancer = advice_patient.family_history_of_cancer  === true ? "" : ""
        msgAdviceManAge70More = (advice_patient.man === true && advice_patient.age >= 70) ? "" : ""
        msgAdviceManAge75More = (advice_patient.man === true && advice_patient.age >= 75) ? "" : ""
        msgAdviceEvaluateCausesHospitalVisits = advice_patient.evaluate_causes_of_hospital_visits === true ? "" : ""
        msgAdviceRiskHospitalization = advice_patient.evaluate_risk_of_hospitalization === true ? "" : ""
        msgAdviceEvaluateSearchDoctors = advice_patient.evaluate_references_searches_of_doctors === true ? "" : ""
        msgAdviceTheSpecialties = advice_patient.evaluate_the_specialties === true ? "" : ""
        msgAdviceObesity = advice_patient.obesity === true ? "" : ""
        msgAdviceHighHealthServices = advice_patient.high_utilization_of_health_services === true ? "" : ""
 
    end

  end
  