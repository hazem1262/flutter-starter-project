import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterstarterproject/data/home/models/albums_response_entity.dart';

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
      body: FutureBuilder<List<AlbumsResponseEntity>>(
        future: getPosts(),
        builder: (buildContext, snapshot){
          if(snapshot.hasData){
            var response = snapshot.data;
            return ListView.builder(
              itemCount: response.length,
              itemBuilder: (buildContext, index){
                var album = response[index];
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

  Future<List<AlbumsResponseEntity>> getPosts() async{
    try{
      var dio = Dio();
      var response = await dio.get<List<dynamic>>("http://jsonplaceholder.typicode.com/albums");
      print("status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        var userId = response.data[0]['userId'];
        var userTitle = response.data[0]['title'];
        print('userId: $userId, userTitle:$userTitle');
        List<AlbumsResponseEntity> albums = List<AlbumsResponseEntity>.from(response.data.map((e) => AlbumsResponseEntity().fromJson(e)));
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
    print("albums count is : ${albums.length}");
  }

}
