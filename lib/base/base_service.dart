import 'package:flutterstarterproject/utils/services/network_service.dart';
import 'package:get/get.dart';

class BaseService{
  final NetworkService _networkService = Get.find<NetworkService>();
  NetworkService get networkService => _networkService;
}