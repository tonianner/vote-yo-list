app.factory('LocationFactory', LocationFactory);

LocationFactory.$inject = ['$resource'];

function LocationFactory($resource) {
  return $resource('http://localhost:3000/api/events/:eventId/locations/:id',
    {eventId:'@eventId', id:'@id'},
    {'update': { method:'PUT' }}
  );

}
