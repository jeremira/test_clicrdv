json.extract! appointment, :id, :calendar_id, :intervention_id, :start_at, :end_at, :customer_name, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
