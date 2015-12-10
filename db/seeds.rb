Event.delete_all

# User.find_by(id: 2).events
# Event.find_by(id: 9).users.find_by(id: 2)
# http://stackoverflow.com/questions/26572914/rails-3-how-to-populate-a-join-table-with-seeds-rb
Event.create(title: "Barbeque", users: User.where(id: 2))
Event.create(title: "Xmas party", users: User.where(id: 2))
Event.create(title: "Xmas party", users: User.where(id: 2))
Event.create(title: "Not user 2 event title", users: User.where(id: 1))
