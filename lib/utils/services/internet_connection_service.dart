import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class InternetConnectionService extends GetxService {
  InternetConnectionService._();

  final Connectivity _connectivity = Connectivity();
  RxBool hasInternetConnection = false.obs;

  StreamSubscription<ConnectivityResult> _subscription;

  static Future<InternetConnectionService> init() async {
    final InternetConnectionService service = InternetConnectionService._();

    service._subscription = service._connectivity.onConnectivityChanged
        .listen(service._connectionChange);
    await service._checkConnection();
    return service;
  }

  @override
  void onClose() {
    _subscription.cancel();

    super.onClose();
  }

  void _connectionChange(ConnectivityResult result) {
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    final bool oldConnectionStatus = hasInternetConnection.value;
    bool newConnectionStatus;

    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        newConnectionStatus = true;
      } else {
        newConnectionStatus = false;
      }
    } on SocketException {
      newConnectionStatus = false;
    }

    if (oldConnectionStatus != newConnectionStatus) {
      hasInternetConnection(newConnectionStatus);
    }
  }
}
