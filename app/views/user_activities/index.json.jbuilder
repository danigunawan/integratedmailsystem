json.array!(@user_activities) do |user_activity|
  json.extract! user_activity, :id, :username, :controller, :action, :activity, :time
  json.url user_activity_url(user_activity, format: :json)
end
