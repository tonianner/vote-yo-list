app.factory('FriendFactory', FriendFactory);

FriendFactory.$inject = ['$resource'];

function FriendFactory($resource) {

  return $resource('http://localhost:3000/api/events/:eventId/users/:userId',
    {eventId:'@eventId', userId:'@userId'}
  );
}
