import 'package:dio/dio.dart';

class NetworkUtil{
  static final NetworkUtil _networkUtil = NetworkUtil._internal();
  Dio dio = new Dio();
  NetworkUtil._internal(){
    initDio();
  }
  factory NetworkUtil(){
    return _networkUtil;
  }

  void initDio() {
    // Set default configs
    dio.options.baseUrl = "http://jsonplaceholder.typicode.com";
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<T> get<T>(String endPoint) async{
    try{
      Response<T> response = await dio.get<T>(endPoint);
      if(response.statusCode < 200 || response.statusCode > 400 || response.data == null){
        print("status code error : ${response.statusCode}");
        return Future.error("Network error status code error: $endPoint");      //todo (make some error objects)
      } else{
        return response.data;
      }
    } catch(e){
      print("Network error parsing error: $endPoint");
      return Future.error(Exception("Network error parsing error: $endPoint"));
    }
  }
}