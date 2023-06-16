class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: :index

    def after_sign_in_path_for(resource)

        if resource.is_a?(User)
          if resource.role == 'patient' && resource.patient.present?

            # Se for um paciente com questionário preenchido, redirecione para a página de resultados
            #patient_result_path(resource.patient)
            new_answer_path
          else

            # Caso contrário, redirecione para a página inicial ou para outra página desejada
            root_path
          end
        else
          super
        end
    end
      

end
