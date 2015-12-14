json.array!(@event.users) do |user|
  json.(user, :id, :email, :nickname )
end
