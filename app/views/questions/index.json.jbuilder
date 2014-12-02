json.array!(@questions) do |question|
  json.extract! question, :id, :title, :description
  json.url question_url(question, format: :json)
end
