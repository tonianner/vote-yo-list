# Event.delete_all

# User.find_by(id: 2).events
# Event.find_by(id: 9).users.find_by(id: 2)
# http://stackoverflow.com/questions/26572914/rails-3-how-to-populate-a-join-table-with-seeds-rb
# Event.create(title: "Barbeque", users: User.where(id: 2))
# Event.create(title: "Xmas party", users: User.where(id: 2))
# Event.create(title: "Xmas party 2", users: User.where(id: 2))
# Event.create(title: "Not user 2 event title", users: User.where(id: 1))
# Event.create(title: "Wedding party", users: User.where(id: 2))


# Task.delete_all
# Task.create([
#   { title: "first: Bring yourself",
#     description: "be pretty",
#     event_id: Event.first.id,
#     completed: false
#   },
#   { title: "first: Bring more of your ",
#     description: "be pretty pretty self completed: false",
#     event_id: Event.first.id,
#     completed: false
#   },
#   { title: "last: event 2 title",
#     description: "event 2 description completed true",
#     event_id: Event.last.id,
#     completed: true
#   },
#   { title: "last: event 2 title 2",
#     description: "event 2 description completed true",
#     event_id: Event.last.id,
#     completed: true
#   },
#   { title: "lastevent  title 3",
#     description: "event 2 description completed true",
#     event_id: Event.last.id,
#     completed: true
#   }
# ])



