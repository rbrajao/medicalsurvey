json.extract! event, :id, :survey_id, :organization_id, :name, :date_init, :date_end, :acessurl, :status, :created_at, :updated_at
json.url event_url(event, format: :json)
