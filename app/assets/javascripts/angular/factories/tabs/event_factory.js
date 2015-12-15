app.factory('EventFactory', EventFactory);

EventFactory.$inject = ['$resource'];

function EventFactory($resource) {

  return $resource('http://localhost:3000/api/events/:id',
    {id: '@_id'},
    {'update': { method:'PUT' }}
  );

}
