

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/features/login/login_screen.dart';

import 'package:flutter_testing/main.dart';

void main() {
  testWidgets('email and password is not empty, success', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    bool isSuccessful = false;

    LoginScreen page = LoginScreen(onSignIn: (value){
      isSuccessful = value;
    },);
    await tester.pumpWidget(buildTestableWidget(page));
    
    Finder emailField = find.byKey(Key("email"));
    await tester.enterText(emailField, 'haroldevg@gmail.com');
    
    
    Finder passwordField = find.byKey(Key("password"));
    await tester.enterText(passwordField, "def123abc");

    await tester.tap(find.byKey(Key("signin")));

    expect(isSuccessful,true);

  });
}

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}
