json.extract! interviewee, :id, :last_name, :age, :sex, :created_at, :updated_at
json.url interviewee_url(interviewee, format: :json)
