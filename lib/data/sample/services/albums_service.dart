import 'package:flutterstarterproject/data/sample/models/albums_response_entity.dart';
import 'package:flutterstarterproject/utils/network/consts.dart';
import 'package:flutterstarterproject/utils/network/network_util.dart';

class AlbumsService{

  Future<List<AlbumsResponseEntity>> getAlbums() async{
    var response = await NetworkUtil().get(ALBUMS);
    List<AlbumsResponseEntity> albums = List<AlbumsResponseEntity>.from(response.map((e) => AlbumsResponseEntity().fromJson(e)));
    return albums;
  }

}