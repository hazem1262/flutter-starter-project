import 'package:flutter/material.dart';
import 'package:flutterstarterproject/data/sample/models/albums_response_entity.dart';
import 'package:flutterstarterproject/data/sample/sample_repository.dart';
import 'package:get/get.dart';

class SampleModel extends GetxController{
  SampleRepository sampleRepository = SampleRepository();
  List<AlbumsResponseEntity> albums;

  SampleModel(){
    getAlbums();
  }
  getAlbums(){
    sampleRepository.getAlbums()
        .then((newAlbums){
          albums = newAlbums;
          update();
    });
  }
}