
class Album{
  final int id;
  final int userId;
  final String title;

  Album({this.id, this.userId, this.title});

  // why use factory constructor?
  //https://dart.dev/guides/language/language-tour#constructors
  /*
  Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class.
   For example, a factory constructor might return an instance from a cache, or it might return an instance of a subtype.
    ***Another use case for factory constructors is initializing a final variable
    using logic that can’t be handled in the initializer list. ****

    final variables do not have setters so you have to initialize them using factory constructors or using short hand this in normal constructors
  * */
  factory Album.fromJson(Map<String, dynamic> json){
    return Album(
        id: json['id'],
        userId: json['userId'],
        title: json['title']
    );
  }
}

class AlbumsResponse{
  final List<Album> albums;

  AlbumsResponse(this.albums);
  factory AlbumsResponse.fromJson(List<dynamic> json){
    return AlbumsResponse(List<Album>.from(json.map((e) => Album.fromJson(e))));
  }
}