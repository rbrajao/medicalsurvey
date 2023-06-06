class Answer < ApplicationRecord
  belongs_to :patient

    #Informações Gerais
    
    enum sex: { Feminino: "Feminino", Masculino: "Masculino" }
    enum self_perception: { Excelente: "Excelente", MuitoBoa: "Muito boa", Boa: "Boa", Media: "Média", Ruim: "Ruim" } 
    enum night_as_patient: { NenhumaVez: "Não, nenhuma vez", UmaVez: "Uma vez", DuasTresVezes: "Duas ou três vezes", MaisTresVezes: "Mais do que três vezes" } 
    enum searched_doctor: { sd_NenhumaVez: "Nenhuma vez", sd_UmaVez: "Uma vez", sd_DuasTresVezes: "Duas ou três vezes", sd_QuatroSeisVezes: "Quatro a seis vezes", sd_MaiSeisVezes: "Mais do que seis vezes" } 
    enum pain_that_impairs: { NaoTemDor: "Não tem dor", TemDorInterferePouco: "Tem dor mas interfere pouco na realização de suas atividades", InterfereModeradoAtividades: "Tem dor que interfere moderadamente na realização de suas atividades", pain_that_impairs_4: "Tem dor que interfere intensamente na realização de suas atividades" } 
    # #enum usage_profile: {option1: "Nenhuma", option2: "Até quatro", option3: "Acima de cinco"}
    enum many_daily_medications: {Nenhuma: "Nenhuma", AteQuatro: "Até quatro", AcimaCinco: "Acima de cinco"}
    
    # #Histórico de patologias
    enum have_diabetes: { Diabetes_Sim: "Sim", Diabetes_Nao: "Não" } 
    enum glycated_hemoglobin: { Maior7: "Maior que 7", MenorIgual7: "Menor ou igual a 7", NaoSabe: "Não sabe" } 
    enum heart_attack: { heart_attack_sim: "Sim", heart_attack_nao: "Não" } 
    enum family_history_of_cancer: { family_history_of_cancer_sim: "Sim", family_history_of_cancer_nao: "Não" } 
    enum what_family_cancer: { Mama_Ovario: "Mama/Ovário", tratogastointestinal: "Trato Gastro Intestinal (estômago, intestino, pâncreas)", Prostata: "Próstata" , Leucemia: "Leucemia", Outros: "Outros (tireoide, rins, pulmão, melanoma, etc.)" } 
    enum had_cancer: { had_cancer_sim: "Sim", had_cancer_nao: "Não" } 
    enum what_your_cancer: { y_mama_ovario: "Mama/Ovário", y_tratogastointestinal: "Trato Gastro Intestinal (estômago, intestino, pâncreas)", y_prostata: "Próstata" , y_leucemia: "Leucemia", y_outros: "Outros (tireoide, rins, pulmão, melanoma, etc.)" } 
    
    # #Histórico neurológico
    enum treatment_of_depression: { treatment_of_depression_sim: "Sim", treatment_of_depression_nao: "Não" } 
    enum memory_disease: { memory_disease_sim: "Sim", memory_disease_nao: "Não" } 
    enum jitters_that_impairs: { NaoSenteStress: "Não sente estresse ou nervosismo", SenteStressPouco: "Sente estresse e/ou nervosismo mas interferem pouco na realização de suas atividades", SenteStressModerado: "Sente estresse e/ou nervosismo que interferem moderadamente na realização de suas atividades", SenteStressIntenso: "Sente estresse e/ou nervosismo que interferem intensamente na realização de suas atividades" } 
    
    # #Informações sobre a saúde
    enum treatment_for_blood_pressure: { treatment_for_blood_pressure_sim: "Sim", treatment_for_blood_pressure_nao: "Não" } 
    enum cholesterol_control: { cholesterol_control_sim: "Sim", cholesterol_control_nao: "Não" } 
    enum high_cholesterol: { high_cholesterol_sim: "Sim", high_cholesterol_nao: "Não" } 
    enum total_cholesterol: { tc_menor160: "Menor que 160", tc_entre160_199: "Entre 160-199", tc_entre200_239: "Entre 200-239", tc_entre240_279: "Entre 240-279", tc_maior280: "Maior que 280", tc_naosei: "Não sei" } 
    enum hdl: { hdl_menor40: "Menor que 40", hdl_entre40_49: "Entre 40-49", hdl_entre50_59: "Entre 50-59", hdl_maior60: "Maior que 60", hdl_naosei: "Não sei" } 
    enum abdominal_circumference: { man_abdominal_circumference_menor94: "Menor ou Igual a 94cm", man_abdominal_circumference_entre95_102: "Entre 95cm a 102 cm", man_abdominal_circumference_maior102: "Maior que 102 cm", woman_abdominal_circumference_menor80: "Menor ou Igual a 80cm", woman_abdominal_circumference_entre81_88: "Entre 81 a 88 cm", woman_abdominal_circumference_maior88: "Maior que 88 cm" }

    # #Hábitos e comportamento
    enum smoker: { smoker_fumante: "Fumante", smoker_exfumante: "Ex-fumante, parou há menos de 20 anos", smoker_exfumantemais20: "Ex-fumante, parou há mais de 20 anos", smoker_nunca: "Nunca fumou" } 
    #enum cigarettesQuantity
    #enum manyYearsSmoked 
    enum minutes_of_physical_activity: { minutes_of_physical_activity_nenhuma: "Nenhuma atividade física", minutes_of_physical_activity_menos150: "Menos de 150 minutos", minutes_of_physical_activity_mais150: "Mais do que 150 minutos" } 
    enum active_sex_life: { active_sex_life_sim: "Sim", active_sex_life_nao: "Não" } 

    # #Informações específicas
    enum someone_to_look: { someone_to_look_sim: "Sim", someone_to_look_nao: "Não" } 
    enum who_needs_assistance: { who_needs_assistance_sim: "Sim", who_needs_assistance_nao: "Não" }  


    validates :sex, presence: true
    validates :self_perception, presence: true

    
    def CalculateScore(question_params)

      score_final = 0
 
      #calculate the age of the pacient
      age = ((Date.today - Date.parse(question_params[:birth_date]) )/365.24).to_i
      #puts age

      #verify sex information
      sex = question_params[:sex]
      score_final += 2 if sex == "Masculino"
      
      
      #verify self perception
      self_perception_map = {
        "Excelente" => -4,
        "MuitoBoa" => -2,
        "Boa" => 0,
        "Media" => 2,
        "Ruim" => 4
      }
      score_final += self_perception_map[self_perception]


      #verify night_as_pacient
      night_as_patient_map = {
        "NenhumaVez" => 0,
        "UmaVez" => 2,
        "DuasTresVezes" => 4,
        "MaisTresVezes" => 6
      }
      score_final += night_as_patient_map[night_as_patient]

      
      #verify searched_doctor
      searched_doctor_map = {
        "sd_NenhumaVez" => 0,
        "sd_UmaVez" => 1,
        "sd_DuasTresVezes" => 2,
        "sd_QuatroSeisVezes" => 3, 
        "sd_MaiSeisVezes" => 4, 
      }
      score_final += searched_doctor_map[searched_doctor]


      #verify diabetes information
      score_diabetes = question_params[:have_diabetes]
      score_final += 15 if score_diabetes == "Diabetes_Sim"

      #verify heart_attack information
      score_heartattack = question_params[:heart_attack]
      score_final += 6 if score_heartattack == "heart_attack_sim"

      #verify smoker
      smoker_map = {
        "smoker_fumante" => 9,
        "smoker_exfumante" => 2,
        "smoker_exfumantemais20" => 0,
        "smoker_nunca" => 0
      }
      score_final += smoker_map[smoker]

      #verify abdominal circumference
      abdominal_circumference_map = {
        "man_abdominal_circumference_menor94" => 0,
        "man_abdominal_circumference_entre95_102" => 2,
        "man_abdominal_circumference_maior102" => 4,
        "woman_abdominal_circumference_menor80" => 0, 
        "woman_abdominal_circumference_entre81_88" => 2,
        "woman_abdominal_circumference_maior88" => 4
      }
      score_final += abdominal_circumference_map[abdominal_circumference]

      #verify active_sex_life information
      score_active_sex_life = question_params[:active_sex_life]
      score_final += 1 if score_active_sex_life == "active_sex_life_sim"

      #verify family_history_of_cancer information
      score_family_history_of_cancer = question_params[:family_history_of_cancer]
      score_final += 1 if score_family_history_of_cancer == "family_history_of_cancer_sim"

      #verify what_family_cancer
      what_family_cancer_map = {
      "Mama_Ovario" => 3,
      "tratogastointestinal" => 3,
      "Prostata" => 2,
      "Leucemia" => 2, 
      "Outros" => 1
    }
    score_final += what_family_cancer_map[what_family_cancer]

    #verify treatment_of_depression information
    score_treatment_of_depression = question_params[:treatment_of_depression]
    score_final += 2 if score_treatment_of_depression == "treatment_of_depression_sim"

    #verify memory_disease information
    score_memory_disease = question_params[:memory_disease]
    score_final += 4 if score_memory_disease == "memory_disease_sim"

    #verify someone_to_look information
    score_someone_to_look = question_params[:someone_to_look]
    score_final += 2 if score_someone_to_look == "someone_to_look_sim"   

    #verify who_needs_assistance information
    score_who_needs_assistance = question_params[:who_needs_assistance]
    score_final += 6 if score_who_needs_assistance == "who_needs_assistance_sim"       

    #verify had_cancer information
    score_had_cancer = question_params[:had_cancer]
    score_final += 1 if score_had_cancer == "had_cancer_sim"   

    #verify what_your_cancer
    what_your_cancer_map = {
      "y_mama_ovario" => 5,
      "y_tratogastointestinal" => 5,
      "y_prostata" => 3,
      "y_leucemia" => 4, 
      "y_outros" => 3
    }
    score_final += what_your_cancer_map[what_your_cancer]

    #verify many_daily_medications
    many_daily_medications_map = {
      "Nenhuma" => 0,
      "AteQuatro" => 2,
      "AcimaCinco" => 4
    }
    score_final += many_daily_medications_map[many_daily_medications]


    #systolic blood pressure control
    score_systolic_blood_pressure=0
    case question_params[:systolic_blood_pressure].to_i
    when 0...120
      score_systolic_blood_pressure = 0
    when 121..129
      score_systolic_blood_pressure = 2
    when 130..139
      score_systolic_blood_pressure = 4
    when 140..159
      score_systolic_blood_pressure = 6
    else
      score_systolic_blood_pressure = 8  
    end
    score_final += score_systolic_blood_pressure


    #this.bmiWeight / (this.bmiHeight * this.bmiHeight);
    score_height = question_params[:bmi_height].gsub(",", ".").to_f
    score_weight = question_params[:bmi_weight].gsub(",", ".").to_f
    score_bmi = score_weight / (score_height*score_height)
    score_bmi_value = ""
    
    case 
    when age>60 && score_bmi < 22
      score_bmi_value = "BMI_LIGHTWEIGHT"
    when age>60 && (score_bmi >=22 && score_bmi <= 27)
      score_bmi_value = "BMI_EUTROPHIC"
    when age>60 && score_bmi > 27
      score_bmi_value = "BMI_OBESITY"
    when age <= 60 && (score_bmi >=25 && score_bmi <= 30)
      score_bmi_value = "BMI_OVERWEIGHT"
    when age <= 60 && score_bmi > 30
      score_bmi_value = "BMI_OBESITY"
    when age <= 60 && score_bmi < 25
      score_bmi_value = "BMI_NORMAL"
    end

  


    ############################ DIABETES QUESTIONS ###############################
    score_have_diabetes = question_params[:have_diabetes]
    score_treatment_for_blood_pressure = question_params[:treatment_for_blood_pressure]
    score_cholesterol_control = question_params[:cholesterol_control]


    #verify minutes_of_physical_activity
    if score_have_diabetes == "Diabetes_Nao"
        
        if score_treatment_for_blood_pressure == "treatment_for_blood_pressure_sim"
          score_final += 2 
        end
        
        if score_cholesterol_control == "cholesterol_control_sim"
          score_final += 2 
        end
      
        minutes_of_physical_activity_map = {
          "minutes_of_physical_activity_nenhuma" => 3,
          "minutes_of_physical_activity_menos150" => 0, 
          "minutes_of_physical_activity_mais150" => -3
        }
        score_final += minutes_of_physical_activity_map[minutes_of_physical_activity]

        have_diabetes_bmi_map = {
          "BMI_LIGHTWEIGHT" => 0,
          "BMI_NORMAL" => 0,
          "BMI_OBESITY" => 2,
          "BMI_OVERWEIGHT" => 1, 
          "BMI_EUTROPHIC" => 0
        }
        score_final += have_diabetes_bmi_map[score_bmi_value]


    elsif score_have_diabetes == "Diabetes_Sim"
      
      if score_treatment_for_blood_pressure == "treatment_for_blood_pressure_sim"
        score_final += 6 
      end
      
      if score_cholesterol_control == "cholesterol_control_sim"
        score_final += 6 
      end

      minutes_of_physical_activity_map = {
        "minutes_of_physical_activity_nenhuma" => 9,
        "minutes_of_physical_activity_menos150" => 0, 
        "minutes_of_physical_activity_mais150" => -3
      }
      score_final += minutes_of_physical_activity_map[minutes_of_physical_activity]

      have_diabetes_bmi_map = {
        "BMI_LIGHTWEIGHT" => 0,
        "BMI_NORMAL" => 0,
        "BMI_OBESITY" => 2,
        "BMI_OVERWEIGHT" => 1, 
        "BMI_EUTROPHIC" => 6
      }
      score_final += have_diabetes_bmi_map[score_bmi_value]

    end   
    
    
    ############################ CHOLESTEROL QUESTIONS ###############################
    score_cholesterol_control = question_params[:cholesterol_control]
    hdl_map = {
      "hdl_menor40" => 2,
      "hdl_entre40_49" => 0,
      "hdl_entre50_59" => -1,
      "hdl_maior60" => -2,
      "hdl_naosei" => 0
    }
    
    if score_cholesterol_control == "cholesterol_control_sim"
      hdl_map["hdl_naosei"] = 2
    end
    score_final += hdl_map[hdl]

    ## total cholesterol
    total_cholesterol_map = {
      "tc_menor160" => 0,
      "tc_entre160_199" => 1,
      "tc_entre200_239" => 2,
      "tc_entre240_279" => 3,
      "tc_maior280" => 4, 
      "tc_naosei" => 0
    }
    
    if score_cholesterol_control == "cholesterol_control_sim"
      total_cholesterol_map["tc_naosei"] = 4
    end
    score_final += total_cholesterol_map[total_cholesterol]

    ## GlycatedHemoglobin
    glycated_hemoglobin_map = {
      "Maior7" => 4,
      "MenorIgual7" => 0,
      "NaoSabe" => 0
    }
    
    if score_cholesterol_control == "cholesterol_control_sim"
      glycated_hemoglobin_map["NaoSabe"] = 4
    end
    score_final += glycated_hemoglobin_map[glycated_hemoglobin]



    return score_final

    end

end
