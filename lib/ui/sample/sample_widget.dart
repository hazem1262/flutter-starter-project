import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterstarterproject/data/home/models/albums_response_entity.dart';
import 'package:flutterstarterproject/utils/network/error.dart';
import 'package:flutterstarterproject/utils/network/network_util.dart';

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
            if (snapshot.error is ApplicationError){
              ApplicationError error = snapshot.error;
              return Center(child: Text(error.errorMsg),);
            } else if(snapshot.error is Exception){
              Exception error = snapshot.error;
              return Center(child: Text(error.toString()),);
            }
            return Center(child: Text(snapshot.error.toString()),);
          }
          return Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }

  Future<List<AlbumsResponseEntity>> getPosts() async{
    var response = await NetworkUtil().get("/albums");
    List<AlbumsResponseEntity> albums = List<AlbumsResponseEntity>.from(response.map((e) => AlbumsResponseEntity().fromJson(e)));
    return albums;
  }

  void getAlbums() async{
    var albums = await getPosts();
    print("albums count is : ${albums.length}");
  }

}
