json.array!(@comments) do |comment|
  json.extract! comment, :id, :description, :user_id, :question_id, :answer_id
  json.url comment_url(comment, format: :json)
end
