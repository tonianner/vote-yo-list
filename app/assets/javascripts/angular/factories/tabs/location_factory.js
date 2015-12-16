app.factory('LocationFactory', LocationFactory);

LocationFactory.$inject = ['$resource'];

var url = "<%= ENV['URL'] %>" || "http://localhost:3000";

function LocationFactory($resource) {
  return $resource(url + '/api/events/:eventId/locations/:id',
    {eventId:'@eventId', id:'@id'},
    {'update': { method:'PUT' }}
  );

}
