import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('login test', () {
    FlutterDriver driver;

    Future<void> tap(SerializableFinder element) async {
      await driver.tap(element);
    }

    Future<void> type(SerializableFinder element, String text) async {
      await tap(element);
      await driver.enterText(text);
    }

    SerializableFinder findByKey(String key) {
      return find.byValueKey(key);
    }

    Future<String> getText(SerializableFinder element) async {
      return driver.getText(element);
    }

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Login with not empty fields', () async {
      SerializableFinder emailField = findByKey("email");
      SerializableFinder passwordField = findByKey("password");

      await type(emailField,"haroldevg@gmail.com");
      await type(passwordField,"def123abc");


      SerializableFinder loginButton = findByKey("signin");
      await tap(loginButton);
      
      expect(await getText(findByKey("success_message")), equals("SUCCESS!!"));

    });
  });
}
