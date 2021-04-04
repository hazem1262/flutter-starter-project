import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension GetExtensions on GetInterface {
  void showAppSnackbar(String message, {Color backgroundColor}) {
    Get.snackbar(
      null,
      null,
      backgroundColor: backgroundColor ?? Colors.black,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      animationDuration: const Duration(milliseconds: 200),
    );
  }

  void showAppSuccessSnackbar(String message) {
    showAppSnackbar(message, backgroundColor: Colors.green);
  }

  void showAppErrorSnackbar(String message) {
    showAppSnackbar(message, backgroundColor: Colors.red);
  }
}
