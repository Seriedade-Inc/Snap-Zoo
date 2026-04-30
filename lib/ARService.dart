import 'package:flutter/services.dart';

class ARService {
  static const MethodChannel _channel = MethodChannel('ar_check');

  static Future<bool> isSupported() async {
    try {
      final bool result = await _channel.invokeMethod('isARSupported');
      return result;
    } catch (e) {
      return false;
    }
  }
}