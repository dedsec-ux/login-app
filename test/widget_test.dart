import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_app_name/main.dart';

void main() {
  setUpAll(() async {
    // Ensure Firebase is initialized before running tests
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  testWidgets('App initializes and navigates correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the login screen is displayed.
    expect(find.text('Login'), findsOneWidget);

    // Enter email and password.
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password');

    // Tap the 'Login' button.
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify that the home screen is displayed after login.
    expect(find.text('Home'), findsOneWidget);
  });
}
