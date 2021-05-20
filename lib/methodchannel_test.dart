import 'dart:async';
import 'package:flutter/services.dart';

typedef Future<dynamic> CallEventHandler(
    String uuid,
    );

class MethodchannelTest {
  static const MethodChannel _channel =
  const MethodChannel('methodchannel_test');

  static MethodchannelTest get instance => _getInstance();
  static MethodchannelTest _instance;

  static MethodchannelTest _getInstance() {
    if (_instance == null) {
      _instance = MethodchannelTest._internal();
    }
    return _instance;
  }

  factory MethodchannelTest() => _getInstance();

  MethodchannelTest._internal();

  static CallEventHandler _onClicked;

  /// Sets up [MessageHandler] for incoming messages.
  void init({
    CallEventHandler onClicked,
  }) {
    _onClicked = onClicked;
    this.initMessagesHandler();
  }

  void initMessagesHandler() {
    _channel.setMethodCallHandler(_handleMethod);
  }


  Future<void> displayNewActivity() async {

    return _channel.invokeMethod("startNewActivity",{});
  }

  Future<void> _handleMethod(MethodCall call) {
    try {
      print("ON METHOD CALL");
      switch (call.method) {
        case "CALL_TO_FLUTTER":
          return _onClicked("1234");
          break;
        default:
          print("unrecognized  " + call.method);
          throw UnsupportedError("Unrecognized JSON message");
      }
    } catch (ex) {
      print("PACKAGE ERROR");
      print(ex.toString());
    }
  }
}
