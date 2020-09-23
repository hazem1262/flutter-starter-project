import 'package:flutterstarterproject/data/sample/models/albums_response_entity.dart';

albumsResponseEntityFromJson(AlbumsResponseEntity data, Map<String, dynamic> json) {
	if (json['userId'] != null) {
		data.userId = json['userId']?.toDouble();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toDouble();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> albumsResponseEntityToJson(AlbumsResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userId'] = entity.userId;
	data['id'] = entity.id;
	data['title'] = entity.title;
	return data;
}