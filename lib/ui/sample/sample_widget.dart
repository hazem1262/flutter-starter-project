import 'package:flutter/material.dart';
import 'package:flutterstarterproject/base/base_view.dart';
import 'package:flutterstarterproject/ui/sample/sample_model.dart';
import 'package:flutterstarterproject/utils/shared_widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BaseView<SampleModel>(
          model: SampleModel(),
          builder: (context, sampleModel, _){
            return (sampleModel.albums == null) ? CustomLoading()
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
    );
  }
}
