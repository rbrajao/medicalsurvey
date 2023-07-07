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


    def CalculateAge(date_birth)
      
      #calculate the age of the pacient
      age = ((Date.today - Date.parse(date_birth) )/365.24).to_i
      return age
    end


    def CalculateBMIValue(age, height, weight)

        #this.bmiWeight / (this.bmiHeight * this.bmiHeight);
        score_height = height.gsub(",", ".").to_f
        score_weight = weight.gsub(",", ".").to_f
        score_bmi = score_weight / (score_height*score_height)
        
        return score_weight / (score_height * score_height)
        
    end

    def CalculateBMIClassification(age, bmi)
      
      score_bmi_value = ""
      
      case 
      when age>60 && bmi < 22
        score_bmi_value = "BMI_LIGHTWEIGHT"
      when age>60 && (bmi >=22 && bmi <= 27)
        score_bmi_value = "BMI_EUTROPHIC"
      when age>60 && bmi > 27
        score_bmi_value = "BMI_OBESITY"
      when age <= 60 && (bmi >=25 && bmi <= 30)
        score_bmi_value = "BMI_OVERWEIGHT"
      when age <= 60 && bmi > 30
        score_bmi_value = "BMI_OBESITY"
      when age <= 60 && bmi < 25
        score_bmi_value = "BMI_NORMAL"
      end

      return score_bmi_value
  end


    #Hospitalization calculation
    def CalculateHospitalizationScore(question_params)

      #initial value
      bx = -1.802

      #calculate the age of the pacient
      age = CalculateAge(question_params[:birth_date])
      question_params[:age] = age

      #verify self perception
      self_perception_map = {
        "Excelente" => 0,
        "MuitoBoa" => 0.327,
        "Boa" => 0.340,
        "Media" => 0.552,
        "Ruim" => 0.77
      }
      bx += self_perception_map[self_perception]

      #verify sex information
      sex = question_params[:sex]
      bx += 0.257 if sex == "Masculino"

      #verify someone_to_look information
      score_someone_to_look = question_params[:someone_to_look]
      bx -= 0.738 if score_someone_to_look == "someone_to_look_nao"   

      #verify searched_doctor
      searched_doctor_map = {
        "sd_NenhumaVez" => 0,
        "sd_UmaVez" => 0,
        "sd_DuasTresVezes" => 0,
        "sd_QuatroSeisVezes" => 0, 
        "sd_MaiSeisVezes" => 0.318
      }
      bx += searched_doctor_map[searched_doctor]

      score_have_diabetes = question_params[:have_diabetes]
      bx += 0.319 if score_have_diabetes == "Diabetes_Sim"

      #verify heart_attack information
      score_heartattack = question_params[:heart_attack]
      bx += 0.390 if score_heartattack == "heart_attack_sim"


      #verify night_as_pacient
      night_as_patient_map = {
        "UmaVez" => 0,
        "DuasTresVezes" => 0, 
        "MaisTresVezes" =>0,
        "NenhumaVez" => 0.545
      }
      bx += night_as_patient_map[night_as_patient]

      #check age
      case
      when age < 74
        bx += 0

      when age <=79
        bx += 0.255

      when age <= 84
        bx += 0.327

      else
        bx += 0.559
      end

      #calculate the score 
      ebx = Math.exp(bx) 
      score_hospitalization = ebx  / (1 + ebx);

      return score_hospitalization

    end


    def CalculateABVitaScore(question_params)

      weightScore = 0
      min_age = 20
      
      #calculate the age of the pacient
      age = CalculateAge(question_params[:birth_date])

      #check age range
      if age > min_age 

        case age
        when 20..34
          weightScore += 0
        when 35..39
          weightScore += -3
        when 40..44
          weightScore += 0
        when 45..49
          weightScore += 3
        when 50..54
          weightScore += 6
        when 55..59
          weightScore += 8
        when 60..64
          weightScore += 10
        when 65..69
          weightScore += 11
        when 70..74
          weightScore += 12
        when 75..79
          weightScore += 14
        when 80..84
          weightScore += 16
        when 85..200
          weightScore += 18
        end

        #smoker 
        smoker_CIGARETTE_PACKS_SIZE = 20;
        smoker_RESULT_MAX = 14;
        smoker_WEIGHT_CIGARETTE_MAX = 3;
        smoker_WEIGHT_CIGARETTE_MIN = 2;

        smoker_result = (question_params[:cigarettes_quantity].to_d / smoker_CIGARETTE_PACKS_SIZE) * question_params[:many_years_smoked].to_d
        weightScore += smoker_result > smoker_RESULT_MAX ? smoker_WEIGHT_CIGARETTE_MAX : smoker_WEIGHT_CIGARETTE_MIN

        weightScore += CalculateInitialScore(question_params)
        weightScore += CalculateDiabetesScore(question_params)
        weightScore += CalculateCholesterolScore(question_params) #cholesterol, HDl, Glycade
        weightScore += CalculateCardiacScore(question_params)

        return weightScore

      end

    end


    def CalculateInitialScore(question_params)

      score_final = 0
 
      #calculate the age of the pacient
      age = CalculateAge(question_params[:birth_date])

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
      "Outros" => 1,
      nil => 0
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
      "y_outros" => 3,
      nil => 0
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

    return score_final

  end



  def CalculateDiabetesScore(question_params)
    
    score_final = 0

    #calculate the age of the pacient
    age = CalculateAge(question_params[:birth_date])

    
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


    puts score_bmi_value

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
    
    return score_final
    
  end

  def CalculateCholesterolScore(question_params)
    
    score_final = 0

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

  def CalculateCardiacScore(question_params)
    
    cardio_max_value = 24
    cardio_score = 0
    min_age = 20
    max_age = 79

    #return gender information
    gender = question_params[:sex] # Masculino

    #cholesterol question(yes or no) 
    score_cholesterol_control = question_params[:cholesterol_control] # cholesterol_control_sim

    #calculate the age of the pacient
    age = CalculateAge(question_params[:birth_date])

    #check age range
    if age >= min_age && age <= max_age  

       case age
       when 20..34
        
        if gender == "Masculino"
          #age
          cardio_score += -9

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 4,
            "tc_entre200_239" => 7,
            "tc_entre240_279" => 9,
            "tc_maior280" => 11, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 11 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += -7

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 4,
            "tc_entre200_239" => 8,
            "tc_entre240_279" => 13,
            "tc_maior280" => 13, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 13 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]

        end

       when 35..39

        if gender == "Masculino"
          #age
          cardio_score += -4

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 4,
            "tc_entre200_239" => 7,
            "tc_entre240_279" => 9,
            "tc_maior280" => 11, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 11 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += -3

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 4,
            "tc_entre200_239" => 8,
            "tc_entre240_279" => 13,
            "tc_maior280" => 13, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 13 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]

        end

       when 40..44

        if gender == "Masculino"
          #age
          cardio_score += 0

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 3,
            "tc_entre200_239" => 5,
            "tc_entre240_279" => 6,
            "tc_maior280" => 8, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 8 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += 0

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 3,
            "tc_entre200_239" => 6,
            "tc_entre240_279" => 10,
            "tc_maior280" => 10, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 10 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]

        end

       when 45..49

        if gender == "Masculino"
          #age
          cardio_score += 3

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 3,
            "tc_entre200_239" => 5,
            "tc_entre240_279" => 6,
            "tc_maior280" => 8, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 8 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += 3

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 3,
            "tc_entre200_239" => 6,
            "tc_entre240_279" => 10,
            "tc_maior280" => 10, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 10 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
        end

       when 50..54

        if gender == "Masculino"
          #age
          cardio_score += 6

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 2,
            "tc_entre200_239" => 3,
            "tc_entre240_279" => 4,
            "tc_maior280" => 5, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 5 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += 6

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 2,
            "tc_entre200_239" => 4,
            "tc_entre240_279" => 7,
            "tc_maior280" => 7, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 7 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]

        end

       when 55..59

        if gender == "Masculino"
          #age
          cardio_score += 8

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 2,
            "tc_entre200_239" => 3,
            "tc_entre240_279" => 4,
            "tc_maior280" => 5, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 5 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += 8

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 2,
            "tc_entre200_239" => 4,
            "tc_entre240_279" => 7,
            "tc_maior280" => 7, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 7 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
        end 


       when 60..64

        if gender == "Masculino"
          #age
          cardio_score += 10

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 1,
            "tc_entre200_239" => 1,
            "tc_entre240_279" => 2,
            "tc_maior280" => 3, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 3 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += 10

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 1,
            "tc_entre200_239" => 2,
            "tc_entre240_279" => 4,
            "tc_maior280" => 4, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 4 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
        end 


       when 65..69

        if gender == "Masculino"
          #age
          cardio_score += 11

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 1,
            "tc_entre200_239" => 1,
            "tc_entre240_279" => 2,
            "tc_maior280" => 3, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 3 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += 12

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 1,
            "tc_entre200_239" => 1,
            "tc_entre240_279" => 2,
            "tc_maior280" => 3, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 3 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
        end 



       when 70..74

        if gender == "Masculino"
          #age
          cardio_score += 12

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 0,
            "tc_entre200_239" => 0,
            "tc_entre240_279" => 1,
            "tc_maior280" => 1, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 1 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += 14

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 1,
            "tc_entre200_239" => 1,
            "tc_entre240_279" => 2,
            "tc_maior280" => 2, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 2 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
        end 


        
       when 75..79

        if gender == "Masculino"
          #age
          cardio_score += 13

           ## total cholesterol
           cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 0,
            "tc_entre200_239" => 0,
            "tc_entre240_279" => 1,
            "tc_maior280" => 1, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 1 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
          
        else #feminino
          #age
          cardio_score += 16

          ## total cholesterol
          cardio_total_cholesterol_map = {
            "tc_menor160" => 0,
            "tc_entre160_199" => 1,
            "tc_entre200_239" => 1,
            "tc_entre240_279" => 2,
            "tc_maior280" => 2, 
            "tc_naosei" => score_cholesterol_control == "cholesterol_control_sim" ? 2 : 0
          }
          cardio_score += cardio_total_cholesterol_map[total_cholesterol]
        end 


      else #case
        cardio_score +=0 #checar quando mais velho q 80 anos     
      end


      #HDL - cardiac calculate
      #score_cholesterol_control = question_params[:cholesterol_control]
      cardio_hdl_map = {
        "hdl_menor40" => 2,
        "hdl_entre40_49" => 1,
        "hdl_entre50_59" => 0,
        "hdl_maior60" => -2,
        "hdl_naosei" => 0
      }
        
      if score_cholesterol_control == "cholesterol_control_sim"
        cardio_hdl_map["hdl_naosei"] = 2
      end
      cardio_score += cardio_hdl_map[hdl]


      #systolic blood pressure control
      case question_params[:systolic_blood_pressure].to_i
      when 0...120
        cardio_score += gender == "Masculino" ? 0 : 0
      when 121..129
        cardio_score += gender == "Masculino" ? 2 : 1
      when 130..139
        cardio_score += gender == "Masculino" ? 1 : 2
      when 140..159
        cardio_score += gender == "Masculino" ? 1 : 2
      else
        cardio_score += gender == "Masculino" ? 2 : 3 
      end

      #smoker - cardio
      case age
      when 20..34
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 8 : 9) : 0
         
      when 35..39
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 8 : 9) : 0

      when 40..44
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 5 : 7) : 0

      when 45..49
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 5 : 7) : 0

      when 50..54
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 3 : 4) : 0

      when 55..59
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 3 : 4) : 0

      when 60..64
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 1 : 2) : 0

      when 65..69
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 1 : 2) : 0

      when 70..74
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 1 : 1) : 0

      when 75..79
        cardio_score += (smoker == "smoker_fumante") ? (gender == "Masculino" ? 1 : 1) : 0
      end

      #% score
      cardio_max_score_man = 16
      cardio_max_score_woman = 24
      cardio_min_score_woman = 9
      cardio_percent = ""

      if gender == "Masculino"
        if cardio_score < 0 
          cardio_percent = "< 1%"
        elsif cardio_score > cardio_max_score_man
          cardio_percent = "> 30%"
        end
      else
        if cardio_score < cardio_min_score_woman
          cardio_percent = "< 1%"
        elsif cardio_score > cardio_max_score_woman
          cardio_percent = "> 30%"
        end
      end

      if cardio_percent == ""

        case cardio_score
        when 0
          cardio_percent =  "1%"
        when 1
          cardio_percent = "1%"
        when 2
          cardio_percent = "1%"
        when 3
          cardio_percent = "1%"
        when 4
          cardio_percent = "1%"
        when 5
          cardio_percent = "2%"
        when 6
          cardio_percent = "2%"
        when 7
          cardio_percent = "3%"
        when 8
          cardio_percent = "4%"
        when 9
          cardio_percent = gender == "Masculino" ? "5%" : "1%" 
        when 10
          cardio_percent = gender == "Masculino" ? "6%" : "1%" 
        when 11
          cardio_percent = gender == "Masculino" ? "8%" : "1%" 
        when 12
          cardio_percent = gender == "Masculino" ? "10%" : "1%" 
        when 13
          cardio_percent = gender == "Masculino" ? "12%" : "2%" 
        when 14
          cardio_percent = gender == "Masculino" ? "16%" : "2%" 
        when 15
          cardio_percent = gender == "Masculino" ? "20%" : "3%" 
        when 16
          cardio_percent = gender == "Masculino" ? "25%" : "4%" 
        when 17
          cardio_percent = gender == "Masculino" ? "" : "5%" 
        when 18
          cardio_percent = gender == "Masculino" ? "" : "6%" 
        when 19
          cardio_percent = gender == "Masculino" ? "" : "8%" 
        when 20
          cardio_percent = gender == "Masculino" ? "" : "11%" 
        when 21
          cardio_percent = gender == "Masculino" ? "" : "14%" 
        when 22
          cardio_percent = gender == "Masculino" ? "" : "17%"
        when 23
          cardio_percent = gender == "Masculino" ? "" : "22%"  
        when 24
          cardio_percent = gender == "Masculino" ? "" : "27%" 
        end 
      end

      #puts cardio_percent
      return cardio_score
      
    else

      #idade menor que 20 - não tem questionário valido.             

    end

    return cardio_score
  end












  
  def generateAdvice(question_params)

    puts "chegou aqui??"

    #verify diabetes information
   adv_diabetes = question_params[:have_diabetes] === "Diabetes_Sim" ? "S" : "N"
   #puts adv_diabetes

   #verify smoker
   smoker_map = {
     "smoker_fumante" => 1,
     "smoker_exfumante" => 1,
     "smoker_exfumantemais20" => 0,
     "smoker_nunca" => 0
   }
   adv_smoker = smoker_map[smoker]
   #puts adv_smoker

   #verify many_daily_medications
   many_daily_medications_map = {
     "Nenhuma" => 0,
     "AteQuatro" => 1,
     "AcimaCinco" => 1
   }
   adv_manyMedations = many_daily_medications_map[many_daily_medications]
   #puts adv_manyMedations

   #depression
   adv_depression = question_params[:treatment_of_depression] === "treatment_of_depression_sim" ? "S" : "N"
   #puts adv_depression

   #verify sex information
   adv_sex = question_params[:sex] === "Masculino"? "M" : "F"
   #puts adv_sex

   generateAdvicesForDoctorSearchAndNightAsPatients(question_params)
   generateAdvicesCancer(question_params)
   generateAdvicesObesity(question_params)
   generateAdvicesHeartAttackAndBloodPressure(question_params)
   generateAdvicesHighUtilizationOfHealthServices(question_params)

 end

 def generateAdvicesForDoctorSearchAndNightAsPatients(question_params)

   #verify night_as_pacient
   night_as_patient_map = {
     "UmaVez" => 0,
     "DuasTresVezes" => 1, 
     "MaisTresVezes" =>1,
     "NenhumaVez" => 0
   }
   adv_night_as_patient = night_as_patient_map[night_as_patient]
   puts adv_night_as_patient

   #verify searched_doctor
   searched_doctor_map = {
     "sd_NenhumaVez" => 0,
     "sd_UmaVez" => 0,
     "sd_DuasTresVezes" => 0,
     "sd_QuatroSeisVezes" => 1, 
     "sd_MaiSeisVezes" => 1
   }
   adv_searched_doctor = searched_doctor_map[searched_doctor]
   puts adv_searched_doctor

 end






 def generateAdvicesCancer(question_params)
    
   #verify family_history_of_cancer information
   adv_family_history_of_cancer = question_params[:family_history_of_cancer] === "family_history_of_cancer_sim" ? "S" : "N"

   #verify had_cancer information
   adv_had_cancer = question_params[:had_cancer] === "had_cancer_sim" ? "S" : "N"

 end

 def generateAdvicesObesity(question_params)

   #this.bmiWeight / (this.bmiHeight * this.bmiHeight);
   score_height = question_params[:bmi_height].gsub(",", ".").to_f
   score_weight = question_params[:bmi_weight].gsub(",", ".").to_f
   score_bmi = score_weight / (score_height*score_height)
   score_bmi_value = ""
   adv_bmi = 0
   
   case 
   when age>60 && score_bmi < 22
     score_bmi_value = "BMI_LIGHTWEIGHT"
   when age>60 && (score_bmi >=22 && score_bmi <= 27)
     score_bmi_value = "BMI_EUTROPHIC"
   when age>60 && score_bmi > 27
     score_bmi_value = "BMI_OBESITY"
   when age <= 60 && (score_bmi >=25 && score_bmi <= 30)
     score_bmi_value = "BMI_OVERWEIGHT"
     adv_bmi = 1 
   when age <= 60 && score_bmi > 30
     score_bmi_value = "BMI_OBESITY"
     adv_bmi = 1
   when age <= 60 && score_bmi < 25
     score_bmi_value = "BMI_NORMAL"
   end
   #puts adv_bmi

   minutes_of_physical_activity_map = {
     "minutes_of_physical_activity_nenhuma" => 1,
     "minutes_of_physical_activity_menos150" => 1, 
     "minutes_of_physical_activity_mais150" => 0
   }
   adv_minutes_of_physical_activity = minutes_of_physical_activity_map[minutes_of_physical_activity]
   puts adv_minutes_of_physical_activity

 end 

 def generateAdvicesHeartAttackAndBloodPressure(question_params)

   #verify heart_attack information
   adv_heartattack = question_params[:heart_attack] === "heart_attack_sim" ? 1 : 0
   adv_cholesterol_control = question_params[:cholesterol_control] === "cholesterol_control_sim" ? 1 : 0
   adv_treatment_for_blood_pressure = question_params[:treatment_for_blood_pressure] === "treatment_for_blood_pressure_sim" ? 1 : 0

 end

 def generateAdvicesHighUtilizationOfHealthServices(question_params)

   #verify night_as_pacient
   night_as_patient_map = {
     "UmaVez" => 0,
     "DuasTresVezes" => 1, 
     "MaisTresVezes" =>1,
     "NenhumaVez" => 0
   }
   adv_night_as_patient = night_as_patient_map[night_as_patient]
   #puts adv_night_as_patient

   #verify searched_doctor
   searched_doctor_map = {
     "sd_NenhumaVez" => 0,
     "sd_UmaVez" => 0,
     "sd_DuasTresVezes" => 0,
     "sd_QuatroSeisVezes" => 1, 
     "sd_MaiSeisVezes" => 1
   }
   adv_searched_doctor = searched_doctor_map[searched_doctor]

   #puts adv_night_as_patient
   #puts adv_searched_doctor

   if adv_night_as_patient + adv_searched_doctor = 2 
     puts "S"
   end
 end


 def calculate_scores(answer_params)

  self.initial_score = CalculateInitialScore(answer_params)
  puts "Inicial: #{self.initial_score}" 

  #calculate age of the patient
  self.age = CalculateAge(answer_params[:birth_date])

  #BMI values
  self.bmi_value = CalculateBMIValue(self.age, answer_params[:bmi_height], answer_params[:bmi_weight])
  self.bmi_classification = CalculateBMIClassification(self.age, self.bmi_value)

  ################# hospitalization ###############################
  self.hospitalization_score = CalculateHospitalizationScore(answer_params)
  puts "Hospitalização SCORE: #{self.hospitalization_score}" 
  case 
  when self.hospitalization_score < 0.3
    self.hospitalization_classification = "LOW"
  when self.hospitalization_score < 0.4
    self.hospitalization_classification = "INTERMEDIATE"
  when self.hospitalization_score < 0.5
    self.hospitalization_classification = "INTERMEDIATE-HIGH"
  else
    self.hospitalization_classification = "HIGH"
  end
  puts "Hospitalização CLASS: #{self.hospitalization_classification}"


  ################# ABVita ###############################
  self.abvita_score = self.CalculateABVitaScore(answer_params)
  puts "ABVitaScore: #{self.abvita_score}" 
  case 
  when self.abvita_score > 50
    self.abvita_classification = "HIGH"
  when self.abvita_score >=36
    self.abvita_classification = "INTERMEDIATE-HIGH"
  when self.abvita_score >= 17
    self.abvita_classification = "INTERMEDIATE"
  else
    self.abvita_classification = "LOW"
  end
  puts "ABVIta Class: #{self.abvita_classification}"

  ################# Cardio ###############################
  self.cardio_score = CalculateCardiacScore(answer_params)
  puts "Cardio: #{self.cardio_score}"    
  
  case 
  when self.cardio_score < 10
    self.cardio_classification = "LOW"
  when self.cardio_score > 20
    self.cardio_classification =  "HIGH"
  else
    self.cardio_classification =  "INTERMEDIATE"
  end
  puts "Cardio Class: #{self.cardio_classification}"

  ################# Final Score ###############################
  case
  when self.abvita_score > 50 || self.cardio_score > 20 || self.hospitalization_score >= 0.5
    self.final_classification = "HIGH"
  when self.abvita_score >= 36 || self.hospitalization_score > 0.4
    self.final_classification = "INTERMEDIATE-HIGH"
  when self.abvita_score >= 17 || self.cardio_score > 10 || self.hospitalization_score >= 0.3
    self.final_classification = "INTERMEDIATE"
  when self.abvita_score + self.cardio_score > 20 + self.hospitalization_score == 0
    self.final_classification = "Idade insuficiente"
  else
    self.final_classification = "LOW"
  end

  puts "Final score: #{self.final_classification}"

end


end
