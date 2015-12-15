app.factory('ToDoFactory', ToDoFactory);

ToDoFactory.$inject = ['$resource'];

function ToDoFactory($resource) {
  return $resource('http://localhost:3000/api/events/:eventId/tasks/:id',
    {eventId:'@eventId', id:'@id'},
    {'update': { method:'PUT' }}
  );

}
