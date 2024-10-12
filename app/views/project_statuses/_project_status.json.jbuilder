json.extract! project_status, :id, :status, :user_id, :project_id, :created_at, :updated_at
json.url project_status_url(project_status, format: :json)
