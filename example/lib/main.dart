import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:methodchannel_test/methodchannel_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
MethodchannelTest test = MethodchannelTest.instance;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initializeAndSetValue();
    test.init(onClicked: (String uuid){
      _onClicked();
      return;
    });
  }

  initializeAndSetValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("TEST", "test value");
  }

  _onClicked() async {
    print("ON FLUTTER CALLED");
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.getString("TEST");
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: (){
              test.displayNewActivity();
            },
            child: Text('CALL NATIVE ACTIVITY'),
          ),
        ),
      ),
    );
  }
}
