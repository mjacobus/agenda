json.array!(@tasks) do |task|
  json.extract! task, :name, :description, :scheduled_to, :status
  json.url task_url(task, format: :json)
end
