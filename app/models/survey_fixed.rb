class SurveyFixed < ApplicationRecord
    belongs_to :patient
    has_one :answer
    accepts_nested_attributes_for :answer

    #Informações Gerais
    #birthday
    enum sex: {sex_1: "Feminino", sex_2: "Masculino"}
    enum selfPerception: { selfPerception_1: "Excelente", selfPerception_2: "Muito boa", selfPerception_3: "Boa", selfPerception_4: "Média", selfPerception_5: "Ruim" } 
    enum nightAsPatient: { nightAsPatient_1: "Não, nenhuma vez", nightAsPatient_2: "Uma vez", nightAsPatient_3: "Duas ou três vezes", nightAsPatient_4: "Mais do que três vezes" } 
    enum searchedDoctor: { searchedDoctor_1: "Nenhuma vez", searchedDoctor_2: "Uma vez", searchedDoctor_3: "Duas ou três vezes", searchedDoctor_4: "Quatro a seis vezes", searchedDoctor_5: "Mais do que seis vezes" } 
    enum painThatImpairs: { painThatImpairs_1: "Não tem dor", painThatImpairs_2: "Tem dor mas interfere pouco na realização de suas atividades", painThatImpairs_3: "Tem dor que interfere moderadamente na realização de suas atividades", painThatImpairs_4: "Tem dor que interfere intensamente na realização de suas atividades" } 
    # #enum usageProfile: {option1: "Nenhuma", option2: "Até quatro", option3: "Acima de cinco"}
    enum manyDailyMedications: {manyDailyMedications_1: "Nenhuma", manyDailyMedications_2: "Até quatro", manyDailyMedications_3: "Acima de cinco"}
    
    # #Histórico de patologias
    enum haveDiabetes: { haveDiabetes_1: "Sim", haveDiabetes_2: "Não" } 
    enum glycatedHemoglobin: { glycatedHemoglobin_1: "Maior que 7", glycatedHemoglobin_2: "Menor ou igual a 7", glycatedHemoglobin_3: "Não sabe" } 
    enum heartAttack: { heartAttack_1: "Sim", heartAttack_2: "Não" } 
    enum familyHistoryOfCancer: { familyHistoryOfCancer_1: "Sim", familyHistoryOfCancer_1: "Não" } 
    enum whatFamilyCancer: { whatFamilyCancer_1: "Mama/Ovário", whatFamilyCancer_2: "Trato Gastro Intestinal (estômago, intestino, pâncreas)", whatFamilyCancer_3: "Próstata" , whatFamilyCancer_4: "Leucemia", whatFamilyCancer_5: "Outros (tireoide, rins, pulmão, melanoma, etc.)" } 
    enum hadCancer: { hadCancer_1: "Sim", hadCancer_2: "Não" } 
    enum whatYourCancer: { whatYourCancer_1: "Mama/Ovário", whatYourCancer_2: "Trato Gastro Intestinal (estômago, intestino, pâncreas)", whatYourCancer_3: "Próstata" , whatYourCancer_4: "Leucemia", whatYourCancer_5: "Outros (tireoide, rins, pulmão, melanoma, etc.)" } 
    
    # #Histórico neurológico
    enum treatmentOfDepression: { treatmentOfDepression_1: "Sim", treatmentOfDepression_2: "Não" } 
    enum memoryDisease: { memoryDisease_1: "Sim", memoryDisease_2: "Não" } 
    enum jittersThatImpairs: { jittersThatImpairs_1: "Não sente estresse ou nervosismo", jittersThatImpairs_2: "Sente estresse e/ou nervosismo mas interferem pouco na realização de suas atividades", jittersThatImpairs_3: "Sente estresse e/ou nervosismo que interferem moderadamente na realização de suas atividades", jittersThatImpairs_4: "Sente estresse e/ou nervosismo que interferem intensamente na realização de suas atividades" } 
    
    # #Informações sobre a saúde
    enum treatmentForBloodPressure: { option042: "Sim", option043: "Não" } 
    enum cholesterolControl: { option044: "Sim", option045: "Não" } 
    enum systolicBloodPressure: { option046: "Sim", option047: "Não" } 
    enum totalCholesterol: { option048: "Menor que 160", option049: "Entre 160-199", option050: "Entre 200-239", option051: "Entre 240-279", option052: "Maior que 280", option056: "Não sei" } 
    enum hdl: { option057: "Menor que 40", option058: "Entre 40-49", option059: "Entre 50-59", option060: "Maior que 60", option061: "Não sei" } 
    enum abdominalCircumference: { option062: "Menor ou Igual a 94cm", option063: "Entre 95cm a 102 cm", option064: "Maior que 102 cm", option4065: "Menor ou Igual a 80cm", option066: "Entre 81 a 88 cm", option067: "Maior que 88 cm" }

    # #Hábitos e comportamento
    enum smoker: { option068: "Fumante", option069: "Ex-fumante, parou há menos de 20 anos", option070: "Ex-fumante, parou há mais de 20 anos", option071: "Nunca fumou" } 
    #enum cigarettesQuantity
    #enum manyYearsSmoked 
    enum minutesOfPhysicalActivity: { option072: "Nenhuma atividade física", option073: "Menos de 150 minutos", option074: "Mais do que 150 minutos" } 
    enum activeSexLife: { option075: "Sim", option076: "Não" } 

    # #Informações específicas
    enum someoneToLook: { option077: "Sim", option078: "Não" } 
    enum whoNeedsAssistance: { option079: "Sim", option080: "Não" }  


    validates :sex, presence: true
    validates :selfPerception, presence: true
end
