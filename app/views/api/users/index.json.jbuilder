json.array!(@users) do |user|
  json.(user, :id, :email, :nickname )
end
