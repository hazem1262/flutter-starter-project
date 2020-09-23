import 'package:flutterstarterproject/data/sample/models/albums_response_entity.dart';
import 'package:flutterstarterproject/data/sample/services/albums_service.dart';

class SampleRepository{
  AlbumsService albumsService = AlbumsService();

  Future<List<AlbumsResponseEntity>> getAlbums(){
    return albumsService.getAlbums();
  }
}