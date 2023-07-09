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
        
        
        advice_messages = {}


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
            
            advice_messages["msgDoctorInfo"] = "MÉDICO DE NÍVEL 1 (Endocrinologista ou Geriatra) - Consultas 40min"
            advice_messages["msgExamsYears"] = "Fundo de olho, Perfil lipídico, Função renal, Urina I, Microalbuminúria / proteinúria, ECG  (Rotina para a doença)"
            advice_messages["msgExamsQuarterly"] = "Perfil Glicêmico (GJ, Hbglic)"
            advice_messages["msgExamsAnother"] = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação, Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta. Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca. Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco. Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios. Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada. Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."        
            msgExamsGoal = "Controle de fatores de risco modificáveis: dieta, atividade física, excesso de peso"
            msgExamsGoal += (advice_patient.smoker || advice_patient.ex_smoker) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : "" 
            msgExamsGoal += advice_patient.age < 60 ? " Hbglic precisa ser menor ou igual a 7" : ""
            msgExamsGoal += (advice_patient.age >= 60 || advice_patient.age < 85) ? " Hbglic precisa ser menor ou igual a 8" : ""
            msgExamsGoal += " Glicemia sanguínea 140 -180 mg/dl na maioria dos pacientes críticos, como marcador de curto prazo"
            msgExamsGoal += " Atividade Física a atingir 150min/sem (avaliar teste ergométrico se necessário)"
            msgExamsGoal += " Perda de Medidas de circunferência Abdominal (homens 94cm e mulheres 80cm)"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            advice_messages["msgExamsGoal"] = msgExamsGoal
            advice_messages["msgMultiAmbulatory"] = "Ambulatorial: Acompanhamento Nutricional e Prevenção do Pé Diabético"
            advice_messages["msgMultiTherapeuticGroup"] = "Grupos formados por especialidades multidisciplinar com a finalidade de manejo das patologias de risco. Atividades diversas com finalidade terapêutica e não recreativa. Hábitos saudáveis, Auto conhecimento, Auto gerenciamento da saúde, Atividade Física"
            msgMultiTelemonitoring = "Grupo formado por enfermeiras para a realização de controle das metas clínicas dos pacientes abordados e suporte a distancia das demandas para pacientes de Elevado e Intermediario Riscos. Ligações telefônicas amparadas por roteiros e protocolos pré estabelecidos e amparados por suporte medico in loco. Realizado por enfermeiro, Reforçar metas de controle pressórico e lipídico, Resolução de demandas de utilização do sistema, Assistência farmacêutica para interações farmacológicas"
            msgMultiTelemonitoring += answer_patient.hospitalization_classification === "HIGH" ? " Ligações telefônicas quinzenais para resolver demandas, Fidelizar atendimento com médico único" : ""
            msgMultiTelemonitoring += (answer_patient.hospitalization_classification === "INTERMEDIATE" && answer_patient.abvita_classification === "HIGH") ? "  Iniciar Telemonitoramento" : ""
            advice_messages["msgMultiTelemonitoring"] = msgMultiTelemonitoring
            msgAdvice = "Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal, Atividade física supervisionada, Grupos para fortalecer conhecimento da doença e aderência, Agenda de saúde"
            msgAdvice += (advice_patient.smoker || advice_patient.ex_smoker) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            advice_messages["msgAdvice"] = msgAdvice
                        
        elsif advice_patient.diabetes === true && (answer_patient.final_classification === 'INTERMEDIATE-HIGH' || answer_patient.final_classification === 'INTERMEDIATE')

            advice_messages["msgDoctorInfo"] = advice_patient.age > 60 ? "Indicaçaõ de geriatra" : "Indicação de clínico geral - consultas de 30min"
            advice_messages["msgExamsYears"] = "Fundo de olho, Perfil lipídico, Função renal, Urina I, Microalbuminúria / proteinúria, ECG  (Rotina para a doença)"
            advice_messages["msgExamsQuarterly"] = "Perfil Glicêmico (GJ, Hbglic)"
            advice_messages["msgExamsAnother"] = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação, Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta. Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca. Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco. Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios. Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada. Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."        
            msgExamsGoal = "Controle de fatores de risco modificáveis: dieta, atividade física, excesso de peso"
            msgExamsGoal += (advice_patient.smoker || advice_patient.ex_smoker) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : "" 
            msgExamsGoal += advice_patient.age < 60 ? " Hbglic precisa ser menor ou igual a 7" : ""
            msgExamsGoal += (advice_patient.age >= 60 || advice_patient.age < 85) ? " Hbglic precisa ser menor ou igual a 8" : ""
            msgExamsGoal += " Glicemia sanguínea 140 -180 mg/dl na maioria dos pacientes críticos, como marcador de curto prazo"
            msgExamsGoal += " Atividade Física a atingir 150min/sem (avaliar teste ergométrico se necessário)"
            msgExamsGoal += " Perda de Medidas de circunferência Abdominal (homens 94cm e mulheres 80cm)"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            advice_messages["msgExamsGoal"] = msgExamsGoal
            advice_messages["msgMultiAmbulatory"] = "Encaminhar para seguimento Ambulatorial, se: Aumento da HbGlic, Circunferência abdominal ou IMC, Má aderência, Diagnóstico de HAS ou DLP, Risco assistencial"
            advice_messages["msgMultiTherapeuticGroup"] = ""
            advice_messages["msgMultiTelemonitoring"] = ""
            msgAdvice = "Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal, Atividade física supervisionada, Grupos para fortalecer conhecimento da doença e aderência, Agenda de saúde"
            msgAdvice += (advice_patient.smoker || advice_patient.ex_smoker) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            advice_messages["msgAdvice"] = msgAdvice

        elsif advice_patient.diabetes === true && answer_patient.final_classification === 'LOW'
        
            advice_messages["msgDoctorInfo"] = advice_patient.age > 60 ? "Indicaçaõ de geriatra" : "Indicação de clínico geral - consultas de 20min"
            advice_messages["msgExamsYears"] = "Fundo de olho, Perfil lipídico, Função renal, Urina I, Microalbuminúria / proteinúria, ECG  (Rotina para a doença)"
            advice_messages["msgExamsQuarterly"] = "Perfil Glicêmico (GJ, Hbglic)"
            advice_messages["msgExamsAnother"] = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação, Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta. Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca. Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco. Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios. Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada. Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."        
            msgExamsGoal = "Controle de fatores de risco modificáveis: dieta, atividade física, excesso de peso"
            msgExamsGoal += (advice_patient.smoker || advice_patient.ex_smoker) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : "" 
            msgExamsGoal += advice_patient.age < 60 ? " Hbglic precisa ser menor ou igual a 7" : ""
            msgExamsGoal += (advice_patient.age >= 60 || advice_patient.age < 85) ? " Hbglic precisa ser menor ou igual a 8" : ""
            msgExamsGoal += " Glicemia sanguínea 140 -180 mg/dl na maioria dos pacientes críticos, como marcador de curto prazo"
            msgExamsGoal += " Atividade Física a atingir 150min/sem (avaliar teste ergométrico se necessário)"
            msgExamsGoal += " Perda de Medidas de circunferência Abdominal (homens 94cm e mulheres 80cm)"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            advice_messages["msgExamsGoal"] = msgExamsGoal
            advice_messages["msgMultiAmbulatory"] = "Encaminhar para seguimento Ambulatorial, se: Aumento da HbGlic, Circunferência abdominal ou IMC, Má aderência, Diagnóstico de HAS ou DLP, Risco assistencial"
            advice_messages["msgMultiTherapeuticGroup"] = ""
            advice_messages["msgMultiTelemonitoring"] = ""
            msgAdvice = "Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal, Atividade física supervisionada, Grupos para fortalecer conhecimento da doença e aderência, Agenda de saúde"
            msgAdvice += (advice_patient.smoker || advice_patient.ex_smoker) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            advice_messages["msgAdvice"] = msgAdvice

        end

        #checking the hypertension values and advices
        if advice_patient.hypertension && answer_patient.final_classification === 'HIGH'

            advice_messages["msgDoctorInfo-HYP"] = "MÉDICO DE NÍVEL 1 (Endocrinologista ou Geriatra) - Consultas 40min"
            advice_messages["msgExamsYears-HYP"] = "Perfil glicêmico, Perfil lipídico, Função renal, Urina I, ECG"
            advice_messages["msgExamsQuarterly-HYP"] = ""
            advice_messages["msgExamsAnother-HYP"] = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação, Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta. Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca. Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco. Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios. Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada. Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."        
            msgExamsGoal = answer_patient.cardio_classification === "HIGH" ? "PA 130x80" : "PA 140x90"
            msgExamsGoal += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade Física 150min/sem (avaliar teste ergométrico se necessário)" : ""
            msgExamsGoal += " Controle de Peso e de Medidas – Atingir IMC recomendado para a idade e/ou meta de circunferência abdominal (sempre vinculado a assistência nutricional)"    
            msgExamsGoal += " LDL 70 ALTO RISCO"
            msgExamsGoal += " LDL 100 INTERMEDIARIO"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            advice_messages["msgExamsGoal-HYP"] = msgExamsGoal
            advice_messages["msgMultiAmbulatory-HYP"] = "Acompanhamento Nutricional"
            advice_messages["msgMultiTherapeuticGroup-HYP"] = "Grupos formados por especialidades multidisciplinar com a finalidade de manejo das patologias de risco. Atividades diversas com finalidade terapêutica e não recreativa. Hábitos saudáveis, Auto conhecimento, Auto gerenciamento da saúde, Atividade Física"
            msgMultiTelemonitoring = "Grupo formado por enfermeiras para a realização de controle das metas clínicas dos pacientes abordados e suporte a distancia das demandas para pacientes de Elevado e Intermediario Riscos. Ligações telefônicas amparadas por roteiros e protocolos pré estabelecidos e amparados por suporte medico in loco. Realizado por enfermeiro, Reforçar metas de controle pressórico e lipídico, Resolução de demandas de utilização do sistema, Assistência farmacêutica para interações farmacológicas"
            msgMultiTelemonitoring += answer_patient.hospitalization_classification === "HIGH" ? " Ligações telefônicas quinzenais para resolver demandas, Fidelizar atendimento com médico único" : ""
            msgMultiTelemonitoring += (answer_patient.hospitalization_classification === "INTERMEDIATE" && answer_patient.abvita_classification === "HIGH") ? "  Iniciar Telemonitoramento" : ""
            advice_messages["msgMultiTelemonitoring-HYP"] = msgMultiTelemonitoring
            msgAdvice = "Redução do consumo de Sal  para 5gr diários de acordo com a OMS, Estímulo a Dieta rica em frutas, hortaliças, fibras, minerais e laticínios com baixos teores de gordura. Dieta DASH, Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal"
            msgAdvice += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade física supervisionada" : ""
            msgAdvice += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            msgAdvice += " Estímulo a moderação no consumo de álcool (a ingestão diária de etanol deve ser limitada a uma dose ou menos para mulheres e duas doses ou menos para homens)"
            advice_messages["msgAdvice-HYP"] = msgAdvice

        elsif advice_patient.hypertension && answer_patient.final_classification === 'INTERMEDIATE-HIGH'

            advice_messages["msgDoctorInfo-HYP"] = advice_patient.age > 60 ? "Indicaçaõ de geriatra" : "Indicação de clínico geral - consultas de 30min"
            advice_messages["msgExamsYears-HYP"] = "Perfil glicêmico, Perfil lipídico, Função renal, Urina I, ECG"
            advice_messages["msgExamsQuarterly-HYP"] = "Perfil Glicêmico (GJ, Hbglic)"
            advice_messages["msgExamsAnother-HYP"] = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação, Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta. Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca. Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco. Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios. Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada. Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."        
            msgExamsGoal = answer_patient.cardio_classification === "HIGH" ? "PA 130x80" : "PA 140x90"
            msgExamsGoal += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade Física 150min/sem (avaliar teste ergométrico se necessário)" : ""
            msgExamsGoal += " Controle de Peso e de Medidas – Atingir IMC recomendado para a idade e/ou meta de circunferência abdominal (sempre vinculado a assistência nutricional)"    
            msgExamsGoal += " LDL 100 INTERMEDIARIO"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            advice_messages["msgExamsGoal-HYP"] = msgExamsGoal
            advice_messages["msgMultiAmbulatory-HYP"] = "Acompanhamento nutricional"
            advice_messages["msgMultiTherapeuticGroup-HYP"] = "Grupos formados por especialidades multidisciplinar com a finalidade de manejo das patologias de risco. Atividades diversas com finalidade terapêutica e não recreativa, Hábitos saudáveis, Auto conhecimento, Auto gerenciamento da saúde, Atividade Física"
            msgMultiTelemonitoring = "Grupo formado por enfermeiras para a realização de controle das metas clínicas dos pacientes abordados e suporte a distancia das demandas para pacientes de Elevado e Intermediario Riscos. Ligações telefônicas amparadas por roteiros e protocolos pré estabelecidos e amparados por suporte medico in loco. Realizado por enfermeiro, Reforçar metas de controle pressórico e lipídico, Resolução de demandas de utilização do sistema, Assistência farmacêutica para interações farmacológicas"
            msgMultiTelemonitoring += answer_patient.hospitalization_classification === "HIGH" ? " Ligações telefônicas quinzenais para resolver demandas, Fidelizar atendimento com médico único" : ""
            msgMultiTelemonitoring += (answer_patient.hospitalization_classification === "INTERMEDIATE" && answer_patient.abvita_classification === "HIGH") ? "  Iniciar Telemonitoramento" : ""
            advice_messages["msgMultiTelemonitoring-HYP"] = msgMultiTelemonitoring
            msgAdvice = "Redução do consumo de Sal  para 5gr diários de acordo com a OMS, Estímulo a Dieta rica em frutas, hortaliças, fibras, minerais e laticínios com baixos teores de gordura. Dieta DASH, Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal"
            msgAdvice += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade física supervisionada" : ""
            msgAdvice += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            advice_messages["msgAdvice-HYP"] = msgAdvice

        elsif advice_patient.hypertension && (answer_patient.final_classification === 'INTERMEDIATE' || answer_patient.final_classification === 'LOW')

            advice_messages["msgDoctorInfo-HYP"] = "MÉDICO DE NÍVEL 2 (Clínico Geral) - Consultas 20min"
            advice_messages["msgExamsYears-HYP"] = "Perfil glicêmico, Perfil lipídico, Função renal, Urina I, ECG"
            advice_messages["msgExamsQuarterly-HYP"] = ""
            advice_messages["msgExamsAnother-HYP"] = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação, Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta. Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca. Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco. Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios. Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada. Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."        
            msgExamsGoal = answer_patient.cardio_classification === "HIGH" ? "PA 130x80" : "PA 140x90"
            msgExamsGoal += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade Física atingir 150min/sem (avaliar teste ergométrico se necessário)" : ""
            msgExamsGoal += " Controle de Peso e de Medidas – Atingir IMC recomendado para a idade e/ou meta de circunferência abdominal (sempre vinculado a assistência nutricional)"    
            msgExamsGoal += " LDL 100 INTERMEDIARIO"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            advice_messages["msgExamsGoal-HYP"] = msgExamsGoal
            advice_messages["msgMultiAmbulatory-HYP"] = "Encaminhar para seguimento ambulatorial, se: Obesidade, Má Aderência, Risco Assistencial"
            advice_messages["msgMultiAmbulatory-HYP"] += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            advice_messages["msgMultiTherapeuticGroup-HYP"] = ""
            advice_messages["msgMultiTelemonitoring-HYP"] = ""
            msgAdvice = "Redução do consumo de Sal  para 5gr diários de acordo com a OMS, Estímulo a Dieta rica em frutas, hortaliças, fibras, minerais e laticínios com baixos teores de gordura. Dieta DASH, Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal"
            msgAdvice += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade física supervisionada" : ""
            msgAdvice += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            msgAdvice += "Estímulo a moderação no consumo de álcool (a ingestão diária de etanol deve ser limitada a uma dose ou menos para mulheres e duas doses ou menos para homens)"
            advice_messages["msgAdvice-HYP"] = msgAdvice

        end


        #checking the heart disease values and advices
        if advice_patient.heart_disease && (answer_patient.final_classification === 'HIGH' || answer_patient.final_classification === 'INTERMEDIATE-HIGH')

            advice_messages["msgDoctorInfo-HD"] = "MÉDICO DE NÍVEL 1 (Cardiologista ou Geriatra) - Consultas 40min"
            advice_messages["msgExamsYears-HD"] = "Perfil glicêmico, Perfil lipídico, Função renal, Urina I, ECG"
            advice_messages["msgExamsQuarterly-HD"] = ""
            advice_messages["msgExamsAnother-HD"] = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação"
            advice_messages["msgExamsAnother-HD"] += " Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta."
            advice_messages["msgExamsAnother-HD"] += " Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca."
            advice_messages["msgExamsAnother-HD"] += " Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco."
            advice_messages["msgExamsAnother-HD"] += " Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios."
            advice_messages["msgExamsAnother-HD"] += " Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada."
            advice_messages["msgExamsAnother-HD"] += " Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose. + specificAdvices.routines"
            advice_messages["msgExamsAnother-HD"] += " Triar Insuficiência Cardíaca Congestiva para abordagem individualizada"
            msgExamsGoal = answer_patient.cardio_classification === "HIGH" ? "PA 130x80" : "PA 140x90"
            msgExamsGoal += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade Física atingir 150min/sem (avaliar teste ergométrico se necessário)" : ""
            msgExamsGoal += " Controle de Peso e de Medidas – Atingir IMC recomendado para a idade e/ou meta de circunferência abdominal (sempre vinculado a assistência nutricional)"    
            msgExamsGoal += advice_patient.diabetes ? " Controle de fatores de risco modificáveis: dieta, atividade física, excesso de peso" : ""
            msgExamsGoal += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? "Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício, Sessões estruturadas de terapia individual ou em grupo, Medicação de referencia nacional, Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            msgExamsGoal += advice_patient.age < 60 ? " Hbglic precisa ser menor ou igual a 7" : ""
            msgExamsGoal += (advice_patient.age >= 60 || advice_patient.age < 85) ? " Hbglic precisa ser menor ou igual a 8" : ""
            msgExamsGoal += " Glicemia sanguínea 140 -180 mg/dl na maioria dos pacientes críticos, como marcador de curto prazo"
            msgExamsGoal += " Atividade Física a atingir 150min/sem (avaliar teste ergométrico se necessário)"
            msgExamsGoal += " Perda de Medidas de circunferência Abdominal (homens 94cm e mulheres 80cm)"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            advice_messages["msgExamsGoal-HD"] = msgExamsGoal
            advice_messages["msgMultiAmbulatory-HD"] = "Acompanhamento nutricional"

            advice_messages["msgMultiTelemonitoring-HD"] += "Grupo formado por enfermeiras para a realização de controle das metas clínicas dos pacientes abordados e suporte a distancia das demandas para pacientes de Elevado e Intermediario Riscos. Ligações telefônicas amparadas por roteiros e protocolos pré estabelecidos e amparados por suporte medico in loco. Realizado por enfermeiro, Reforçar metas de controle pressórico e lipídico, Resolução de demandas de utilização do sistema, Assistência farmacêutica para interações farmacológicas"
            advice_messages["msgMultiTelemonitoring-HD"] += answer_patient.hospitalization_classification === "HIGH" ? " Ligações telefônicas quinzenais para resolver demandas, Fidelizar atendimento com médico único" : ""
            advice_messages["msgMultiTelemonitoring-HD"] += (answer_patient.hospitalization_classification === "INTERMEDIATE" && answer_patient.abvita_classification === "HIGH") ? "  Iniciar Telemonitoramento" : ""

            msgAdvice = "Redução do consumo de Sal  para 5gr diários de acordo com a OMS, Estímulo a Dieta rica em frutas, hortaliças, fibras, minerais e laticínios com baixos teores de gordura. Dieta DASH, Controle do peso (avaliar indicação de bariátrica para IMC > 40 e > 35 com comorbidades), Medidas da circunferência abdominal"
            msgAdvice += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade física supervisionada" : ""
            msgAdvice += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? " Tabagismo,  Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício Sessões estruturadas de terapia individual ou em grupo Medicação de referencia nacional Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            msgAdvice += "Estímulo a moderação no consumo de álcool (a ingestão diária de etanol deve ser limitada a uma dose ou menos para mulheres e duas doses ou menos para homens)"
            advice_messages["msgAdvice-HD"] = msgAdvice


        elsif advice_patient.heart_disease && answer_patient.final_classification === 'INTERMEDIATE'

            advice_messages["msgDoctorInfo-HD"] = "Clínico Geral - Consultas 20min"
            advice_messages["msgExamsYears-HD"] = "Perfil glicêmico, Perfil lipídico, Função renal, Urina I, ECG"
            advice_messages["msgExamsQuarterly-HD"] = ""
            advice_messages["msgExamsAnother-HD"] = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação"
            advice_messages["msgExamsAnother-HD"] += " Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta."
            advice_messages["msgExamsAnother-HD"] += " Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca."
            advice_messages["msgExamsAnother-HD"] += " Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco."
            advice_messages["msgExamsAnother-HD"] += " Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios."
            advice_messages["msgExamsAnother-HD"] += " Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada."
            advice_messages["msgExamsAnother-HD"] += " Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."
            msgExamsGoal = answer_patient.cardio_classification === "HIGH" ? "PA 130x80" : "PA 140x90"
            msgExamsGoal += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade Física atingir 150min/sem (avaliar teste ergométrico se necessário)" : ""
            msgExamsGoal += " Controle de Peso e de Medidas – Atingir IMC recomendado para a idade e/ou meta de circunferência abdominal (sempre vinculado a assistência nutricional)"    
            msgExamsGoal += advice_patient.diabetes ? " Controle de fatores de risco modificáveis: dieta, atividade física, excesso de peso" : ""
            msgExamsGoal += (advice_patient.smoker === true || advice_patient.ex_smoker === true) ? "Abordagem Intensiva Específica, Pacientes que manifestem desejo de abandonar o vício, Sessões estruturadas de terapia individual ou em grupo, Medicação de referencia nacional, Utilização de Escalas (Entrevista Motivacional, Fagerstrom, Di Clemente)" : ""
            msgExamsGoal += advice_patient.age < 60 ? " Hbglic precisa ser menor ou igual a 7" : ""
            msgExamsGoal += (advice_patient.age >= 60 || advice_patient.age < 85) ? " Hbglic precisa ser menor ou igual a 8" : ""
            msgExamsGoal += " Glicemia sanguínea 140 -180 mg/dl na maioria dos pacientes críticos, como marcador de curto prazo"
            msgExamsGoal += " Atividade Física a atingir 150min/sem (avaliar teste ergométrico se necessário)"
            msgExamsGoal += " Perda de Medidas de circunferência Abdominal (homens 94cm e mulheres 80cm)"
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            advice_messages["msgExamsGoal-HD"] = msgExamsGoal
            advice_messages["msgMultiAmbulatory-HD"] = "Encaminhar para seguimento ambulatorial, se: Aumento da HbGlic, Circunferência abdominal ou IMC, Má Aderência, Diagnóstico de HAS ou DLP, Risco (Assistencial?)"
            advice_messages["msgMultiTherapeuticGroup-HD"] = ""
            advice_messages["msgMultiTelemonitoring-HD"] = ""
            advice_messages["msgAdvice-HD"] = ""

        elsif advice_patient.heart_disease && answer_patient.final_classification === 'LOW'

            advice_messages["msgDoctorInfo-HD"] = "Clínico Geral - Consultas 20min"
            advice_messages["msgExamsYears-HD"] = "Perfil glicêmico, Perfil lipídico"
            advice_messages["msgExamsQuarterly-HD"] = ""
            advice_messages["msgExamsAnother-HD"] = "Exames Pontuais  - Vão depender da avaliação médica e demanda gerada nesta avaliação"
            advice_messages["msgExamsAnother-HD"] += " Radiografia de tórax:Recomendada para pacientes com suspeita clínica de insuficiência cardíaca, quando os demais exames não estão disponíveis, e para avaliação de acometimento pulmonar e de aorta."
            advice_messages["msgExamsAnother-HD"] += " Ecocardiograma:Pacientes hipertensos sem hipertrofia ventricular esquerda ao ECG, mas com dois ou mais fatores de risco; hipertensos com suspeita clínica de insuficiência cardíaca."
            advice_messages["msgExamsAnother-HD"] += " Microalbuminúria em amostra isolada de urina:Pacientes hipertensos diabéticos, hipertensos com síndrome metabólica e hipertensos com dois ou mais fatores de risco."
            advice_messages["msgExamsAnother-HD"] += " Ultrassom de artérias carótidas:Pacientes com sopro carotídeo, com sinais de doença cerebrovascular, ou com doença aterosclerótica em outros territórios."
            advice_messages["msgExamsAnother-HD"] += " Teste ergométrico:Suspeita de doença coronariana estável, diabético ou antecedente familiar para doença coronariana em paciente com pressão arterial controlada."
            advice_messages["msgExamsAnother-HD"] += " Hemoglobina glicada:Em portadores de síndrome matabólica, diabéticos ou intolerantes a glicose."
            msgExamsGoal = answer_patient.cardio_classification === "HIGH" ? "PA 130x80" : "PA 140x90"
            msgExamsGoal += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? "Atividade Física atingir 150min/sem (avaliar teste ergométrico se necessário)" : ""
            msgExamsGoal += " Controle de Peso e de Medidas – Atingir IMC recomendado para a idade e/ou meta de circunferência abdominal (sempre vinculado a assistência nutricional)"    
            msgExamsGoal += advice_patient.age >=85 ? " Paciente muito idoso, risco de queda, risco de Risco de Interação Farmacológica, Risco Nutricional, Seguimento cognitivo" : ""
            advice_messages["msgExamsGoal-HD"] = msgExamsGoal
            advice_messages["msgMultiAmbulatory-HD"] = ""
            advice_messages["msgMultiTherapeuticGroup-HD"] = ""
            advice_messages["msgMultiTelemonitoring-HD"] = ""
            advice_messages["msgAdvice-HD"] = ""

        end

        if advice_patient.smoker && answer_patient.final_classification === 'HIGH'
            advice_messages["msgDoctorInfo-SMK"] = advice_patient.age > 60 ? "MÉDICO DE NÍVEL 1 (Geriatra)" : "MÉDICO DE NÍVEL 2 (Clínico Geral) - Consultas 30min"
            advice_messages["msgExamsYears-SMK"] = "Reforço positivo para cessação do tabagismo, todas as consultas de 3-5min"
            advice_messages["msgExamsYears-SMK"] += " Triar candidatos para tratamento farmacológico e para as Oficinas de abordagem específicas e/ou Pneumologista"
            advice_messages["msgExamsGoal-SMK"] = "20% de abandono"
            advice_messages["msgExamsGoal-SMK"] += advice_patient.age >=85 ? "Paciente muito idoso, Risco de Queda, Risco de Interação Farmacológica, Risco Nutricional e Seguimento cognitivo." : ""
            advice_messages["msgMultiTherapeuticGroup-SMK"] = "Grupos formados por especialidades multidisciplinar com a finalidade de manejo das patologias de risco. Atividades diversas com finalidade terapêutica e não recreativa."
            advice_messages["msgMultiTherapeuticGroup-SMK"] += " Multiprofissional"
            advice_messages["msgMultiTherapeuticGroup-SMK"] += " Terapia cognitivo comportamental"
            advice_messages["msgMultiTherapeuticGroup-SMK"] += " Nutrição"
            advice_messages["msgMultiTherapeuticGroup-SMK"] += answer_patient.minutes_of_physical_activity === "minutes_of_physical_activity_nenhuma" ? " Atividade Física – Mudanças de Hábito" : ""
            advice_messages["msgAdvice-SMK"] = "Avaliar pacientes candidatos aos aconselhamentos: apenas os motivados ao abandono do hábito e com aceitação destes aconselhamentos"

        end 


        puts "Exame anual: #{advice_messages["msgDoctorInfo"]}" 
        puts "Diabetes: #{advice_patient.diabetes}"
        puts answer_patient.final_classification

        
        return advice_messages

    end

    
end