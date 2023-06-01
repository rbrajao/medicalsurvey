class Answer < ApplicationRecord
  belongs_to :patient

        #Informações Gerais
    #birthday
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
    enum systolic_blood_pressure: { systolic_blood_pressure_sim: "Sim", systolic_blood_pressure_nao: "Não" } 
    enum total_cholesterol: { tc_menor160: "Menor que 160", tc_entre160_199: "Entre 160-199", tc_entre200_239: "Entre 200-239", tc_entre240_279: "Entre 240-279", tc_maior280: "Maior que 280", tc_naosei: "Não sei" } 
    enum hdl: { hdl_menor40: "Menor que 40", hdl_entre40_49: "Entre 40-49", hdl_entre50_59: "Entre 50-59", hdl_maior60: "Maior que 60", hdl_naosei: "Não sei" } 
    enum abdominal_circumference: { abdominal_circumference_menor94: "Menor ou Igual a 94cm", abdominal_circumference_entre95_102: "Entre 95cm a 102 cm", abdominal_circumference_maior102: "Maior que 102 cm", abdominal_circumference_menor80: "Menor ou Igual a 80cm", abdominal_circumference_entre81_88: "Entre 81 a 88 cm", abdominal_circumference_maior88: "Maior que 88 cm" }

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

end
