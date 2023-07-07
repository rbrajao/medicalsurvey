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


        msgAdviceSmoker = advice_patient.smoker === true ? "Aconselhamento para Fumante" : ""
        msgAdviceExSmoker = advice_patient.ex_smoker === true ? "Aconselhamento para Ex-Fumante" : ""
        msgAdviceMoreDailyBelow60 = (advice_patient.more_daily_medications===true && advice_patient.age <= 60) ? "Aconselhamento para usuários de vários medicamentos diários (até 60 anos)" : ""
        msgAdviceMoreDailyUp60 = (advice_patient.more_daily_medications===true && advice_patient.age > 60) ? "Aconselhamento para usuários de vários medicamentos diários (acima de 60 anos)" : ""
        msgAdviceTreatmentDepression = advice_patient.treatment_of_depression === true ? "Aconselhamento para tratamento de depressão" : ""
        msgAdviceLittlePhysicalActivity = advice_patient.little_physical_activity === true ? "Aconselhamento para praticantes de pouca atividade física" : ""
        msgAdviceZeroPhysicalActivity = advice_patient.zero_physical_activity === true ? "Aconselhamento para não praticantes de atividade física" : ""
        msgAdviceHadCancer = advice_patient.had_cancer === true ? "Aconselhamento para pacientes que teve câncer" : ""
        msgAdviceFamilyHistoryCancer = advice_patient.family_history_of_cancer  === true ? "Aconsulhamento para pacientes que possui histórico de câncer na familia" : ""
        msgAdviceManAge70More = (advice_patient.man === true && advice_patient.age >= 70) ? "Aconselhamento para homens que possui idade superior a 69 anos" : ""
        msgAdviceManAge75More = (advice_patient.man === true && advice_patient.age >= 75) ? "Aconselhamento para homens que possui idade superior a 75 anos" : ""
        msgAdviceEvaluateCausesHospitalVisits = advice_patient.evaluate_causes_of_hospital_visits === true ? "Aconselhamento para avaliação de causas das visitas ao Hospital" : ""
        msgAdviceRiskHospitalization = advice_patient.evaluate_risk_of_hospitalization === true ? "Aconselhamento para avaliação de riscos de internação em Hospital" : ""
        msgAdviceEvaluateSearchDoctors = advice_patient.evaluate_references_searches_of_doctors === true ? "Aconselhamento para avaliação das pesquisas de referências de médicos" : ""
        msgAdviceTheSpecialties = advice_patient.evaluate_the_specialties === true ? "Aconselhamento para avaliação de especialistas" : ""
        msgAdviceObesity = advice_patient.obesity === true ? "Aconselhamento para obesos" : ""
        msgAdviceHighHealthServices = advice_patient.high_utilization_of_health_services === true ? "Aconselhamento para alta utilização de serviços de saúde" : ""
        
        msgDoctorInfo = ""
        msgExamsYears = ""
        msgExamsQuarterly = ""
        msgExamsAnother = ""
        msgExamsGoal = ""
        msgMultiAmbulatory = ""
        msgMultiTherapeuticGroup = ""
        msgMultiTelemonitoring = ""
        msgAdvice = ""
        msgDemand = ""
        if advice_patient.diabetes === true && answer_patient.final_classification === 'HIGH'
            
            msgDoctorInfo = "MÉDICO DE NÍVEL 1 (Endocrinologista ou Geriatra) - Consultas 40min"
            msgExamsYears = "Fundo de olho, Perfil lipídico, Função renal, Urina I, Microalbuminúria / proteinúria, ECG  (Rotina para a doença)"
            msgExamsQuarterly = "Perfil Glicêmico (GJ, Hbglic)"
            msgExamsAnother = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação, Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta. Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca. Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco. Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios. Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada. Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."        
            msgExamsGoal = "Controle de fatores de risco modificáveis: dieta, atividade física, excesso de peso"
            msgExamsGoal += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : "" 
            msgExamsGoal += advice_patient.age < 60 ? " Hbglic precisa ser menor ou igual a 7" : ""
            msgExamsGoal += (advice_patient.age >= 60 || advice_patient.age < 85) ? " Hbglic precisa ser menor ou igual a 8" : ""
            msgExamsGoal += " Glicemia sanguínea 140 -180 mg/dl na maioria dos pacientes críticos, como marcador de curto prazo"
            msgExamsGoal += " Atividade Física a atingir 150min/sem (avaliar teste ergométrico se necessário)"
            msgExamsGoal += " Perda de Medidas de circunferência Abdominal (homens 94cm e mulheres 80cm)"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            msgMultiAmbulatory = "Ambulatorial: Acompanhamento Nutricional e Prevenção do Pé Diabético"
            msgMultiTherapeuticGroup = "Grupos formados por especialidades multidisciplinar com a finalidade de manejo das patologias de risco. Atividades diversas com finalidade terapêutica e não recreativa. Hábitos saudáveis, Auto conhecimento, Auto gerenciamento da saúde, Atividade Física"
            msgMultiTelemonitoring = "Grupo formado por enfermeiras para a realização de controle das metas clínicas dos pacientes abordados e suporte a distancia das demandas para pacientes de Elevado e Intermediario Riscos. Ligações telefônicas amparadas por roteiros e protocolos pré estabelecidos e amparados por suporte medico in loco. Realizado por enfermeiro, Reforçar metas de controle pressórico e lipídico, Resolução de demandas de utilização do sistema, Assistência farmacêutica para interações farmacológicas"
            msgMultiTelemonitoring += answer_patient.hospitalization_classification === "HIGH" ? " Ligações telefônicas quinzenais para resolver demandas, Fidelizar atendimento com médico único" : ""
            msgMultiTelemonitoring += (answer_patient.hospitalization_classification === "INTERMEDIATE" && answer_patient.abvita_classification === "HIGH") ? "  Iniciar Telemonitoramento" : ""
            msgAdvice = "Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal, Atividade física supervisionada, Grupos para fortalecer conhecimento da doença e aderência, Agenda de saúde"
            msgAdvice += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
                        
        elsif advice_patient.diabetes === true && answer_patient.final_classification === 'INTERMEDIATE-HIGH'

            msgDoctorInfo = advice_patient.age > 60 ? "Indicaçaõ de geriatra" : "Indicação de clínico geral - consultas de 30min"
            msgExamsYears = "Fundo de olho, Perfil lipídico, Função renal, Urina I, Microalbuminúria / proteinúria, ECG  (Rotina para a doença)"
            msgExamsQuarterly = "Perfil Glicêmico (GJ, Hbglic)"
            msgExamsAnother = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação, Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta. Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca. Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco. Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios. Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada. Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."        
            msgExamsGoal = "Controle de fatores de risco modificáveis: dieta, atividade física, excesso de peso"
            msgExamsGoal += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : "" 
            msgExamsGoal += advice_patient.age < 60 ? " Hbglic precisa ser menor ou igual a 7" : ""
            msgExamsGoal += (advice_patient.age >= 60 || advice_patient.age < 85) ? " Hbglic precisa ser menor ou igual a 8" : ""
            msgExamsGoal += " Glicemia sanguínea 140 -180 mg/dl na maioria dos pacientes críticos, como marcador de curto prazo"
            msgExamsGoal += " Atividade Física a atingir 150min/sem (avaliar teste ergométrico se necessário)"
            msgExamsGoal += " Perda de Medidas de circunferência Abdominal (homens 94cm e mulheres 80cm)"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            msgMultiAmbulatory = "Encaminhar para seguimento Ambulatorial, se: Aumento da HbGlic, Circunferência abdominal ou IMC, Má aderência, Diagnóstico de HAS ou DLP, Risco assistencial"
            msgMultiTherapeuticGroup = ""
            msgMultiTelemonitoring = ""
            msgAdvice = "Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal, Atividade física supervisionada, Grupos para fortalecer conhecimento da doença e aderência, Agenda de saúde"
            msgAdvice += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""

        elsif advice_patient.diabetes === true && answer_patient.final_classification === 'LOW'
        
            msgDoctorInfo = advice_patient.age > 60 ? "Indicaçaõ de geriatra" : "Indicação de clínico geral - consultas de 20min"
            msgExamsYears = "Fundo de olho, Perfil lipídico, Função renal, Urina I, Microalbuminúria / proteinúria, ECG  (Rotina para a doença)"
            msgExamsQuarterly = "Perfil Glicêmico (GJ, Hbglic)"
            msgExamsAnother = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação, Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta. Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca. Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco. Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios. Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada. Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."        
            msgExamsGoal = "Controle de fatores de risco modificáveis: dieta, atividade física, excesso de peso"
            msgExamsGoal += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : "" 
            msgExamsGoal += advice_patient.age < 60 ? " Hbglic precisa ser menor ou igual a 7" : ""
            msgExamsGoal += (advice_patient.age >= 60 || advice_patient.age < 85) ? " Hbglic precisa ser menor ou igual a 8" : ""
            msgExamsGoal += " Glicemia sanguínea 140 -180 mg/dl na maioria dos pacientes críticos, como marcador de curto prazo"
            msgExamsGoal += " Atividade Física a atingir 150min/sem (avaliar teste ergométrico se necessário)"
            msgExamsGoal += " Perda de Medidas de circunferência Abdominal (homens 94cm e mulheres 80cm)"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            msgMultiAmbulatory = "Encaminhar para seguimento Ambulatorial, se: Aumento da HbGlic, Circunferência abdominal ou IMC, Má aderência, Diagnóstico de HAS ou DLP, Risco assistencial"
            msgMultiTherapeuticGroup = ""
            msgMultiTelemonitoring = ""
            msgAdvice = "Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal, Atividade física supervisionada, Grupos para fortalecer conhecimento da doença e aderência, Agenda de saúde"
            msgAdvice += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""

        end

        puts answer_patient.final_classification
    end

    
end