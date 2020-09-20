import 'package:flutter/material.dart';
import 'package:flutterstarterproject/data/sample/models/albums_response_entity.dart';
import 'package:flutterstarterproject/data/sample/sample_repository.dart';

class SampleModel extends ChangeNotifier{
  SampleRepository sampleRepository = SampleRepository();
  List<AlbumsResponseEntity> albums;

  SampleModel(){
    getAlbums();
  }
  getAlbums(){
    sampleRepository.getAlbums()
        .then((newAlbums){
          albums = newAlbums;
          notifyListeners();
    });
  }
}