json.extract! patient, :id, :user_id, :event_id, :name, :birthday, :cpf, :status, :created_at, :updated_at
json.url patient_url(patient, format: :json)
