import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:methodchannel_test/methodchannel_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('methodchannel_test');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await MethodchannelTest.platformVersion, '42');
  });
}
