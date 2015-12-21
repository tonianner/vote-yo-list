json.array!(@users) do |user|
  json.(user, :email, :nickname)
end
