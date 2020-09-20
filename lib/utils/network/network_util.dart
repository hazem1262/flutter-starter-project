import 'package:dio/dio.dart';
import 'package:flutterstarterproject/utils/network/consts.dart';
import 'package:flutterstarterproject/utils/network/error.dart';

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
    dio.options.baseUrl = BASE_URL;
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<T> get<T>(String endPoint) async{
    try{
      Response<T> response = await dio.get<T>(endPoint);
      if(response.statusCode < 200 || response.statusCode > 400 || response.data == null){
        print("status code error : ${response.statusCode}");
        return Future.error(getApplicationError(response));
      } else{
        return response.data;
      }
    } catch(e){
      print("Network error parsing error: $endPoint");
      return Future.error(getApplicationErrorFromDioError(e));
    }
  }

  // not used as dio through exception if status code not valid
  ApplicationError getApplicationError(Response response) {
    ErrorType errorType;
    String errorMsg = "Network error"; // todo(read error msg from response )
    if(response.statusCode == 401){
      errorType = Unauthorized();
      errorMsg = "un authorized";
    } else if(response.statusCode == 404){
      errorType = ResourceNotFound();
      errorMsg = "resource not found";
    } else{
      errorType = UnExpected();
      errorMsg = "un expected error";
    }
    return ApplicationError( type: errorType, errorMsg: errorMsg);
  }

  // convert Dio error to application error
  ApplicationError getApplicationErrorFromDioError(DioError dioError) {
    ErrorType errorType;
    String errorMsg = "Network error"; // todo(read error msg from response )
    if(dioError.response.statusCode == 401){
      errorType = Unauthorized();
      errorMsg = "un authorized";
    } else if(dioError.response.statusCode == 404){
      errorType = ResourceNotFound();
      errorMsg = "resource not found";
    } else{
      errorType = UnExpected();
      errorMsg = "un expected error";
    }
    return ApplicationError( type: errorType, errorMsg: errorMsg);
  }
}