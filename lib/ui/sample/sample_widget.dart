import 'package:flutter/material.dart';
import 'package:flutterstarterproject/base/base_view.dart';
import 'package:flutterstarterproject/generated/l10n.dart';
import 'package:flutterstarterproject/ui/sample/sample_model.dart';
import 'package:flutterstarterproject/utils/shared_widgets/loading_widget.dart';

class SampleWidget extends StatelessWidget {
  final String title;
  SampleWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("current local is: ${Localizations.localeOf(context)}");
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).pageTitle),
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
