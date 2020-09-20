import 'package:flutter/material.dart';
import 'package:flutterstarterproject/data/sample/models/albums_response_entity.dart';
import 'package:flutterstarterproject/ui/sample/sample_model.dart';
import 'package:flutterstarterproject/utils/network/error.dart';
import 'package:flutterstarterproject/utils/shared_widgets/loading_widget.dart';
import 'package:provider/provider.dart';

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
        title: Text(widget.title),
      ),
      body: ChangeNotifierProvider<SampleModel>(
        create: (_) => SampleModel(),
        child: Consumer<SampleModel>(
          builder: (context, sampleModel, _){
            return (sampleModel.albums == null)?CustomLoading()
                :ListView.builder(
                itemCount: sampleModel.albums.length,
                itemBuilder: (buildContext, index){
                  var album = sampleModel.albums[index];
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
          },
        ),
      )
    );
  }

  /*Widget buildMainWidget(){
    return FutureBuilder<List<AlbumsResponseEntity>>(
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
    );
  }*/


}
