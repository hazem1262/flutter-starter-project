import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder<AlbumsResponse>(
        future: getPosts(),
        builder: (buildContext, snapshot){
          if(snapshot.hasData){
            var response = snapshot.data;
            return ListView.builder(
              itemCount: response.albums.length,
              itemBuilder: (buildContext, index){
                var album = response.albums[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(album.title, textAlign: TextAlign.center,),
                    ),
                  ),
                );
              }
            );
          } else if (snapshot.hasError){
            return Center(child: Text("Networking error"),);
          }
          return Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }

  Future<AlbumsResponse> getPosts() async{
    try{
      var dio = Dio();
      var response = await dio.get("http://jsonplaceholder.typicode.com/albums");
      print("status code: ${response.statusCode}");
      if (response.statusCode == 200) {

        var userId = response.data[0]['userId'];
        var userTitle = response.data[0]['title'];
        print('userId: $userId, userTitle:$userTitle');
        AlbumsResponse albums = AlbumsResponse.fromJson(response.data);
        return albums;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return Future.error(Exception("network error"));
      }
    } catch(e){
      return Future.error(Exception("network error"));
    }
  }

  void getAlbums() async{
    var albums = await getPosts();
    print("albums count is : ${albums.albums.length}");
  }

}

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