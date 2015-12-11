app.factory('TaskFactory', TaskFactory);

TaskFactory.$inject = ['$resource'];

function TaskFactory($resource) {
  return $resource('http://localhost:3000/api/events/:eventId/tasks/:id',
    {eventId:'@eventId', id:'@id'},
    {'update': { method:'PUT' }}
  );

}
