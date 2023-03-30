import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test_project/src/my_app.dart';

void main() {
  testWidgets('Color changes smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our text is displayed.
    expect(find.text('Hello there'), findsOneWidget);

    // get background color
    final backgroundColor =
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;

    // Tap on the text and trigger a frame.
    await tester.tap(find.byType(Text));
    await tester.pump();

    // Verify that background color is different.
    expect(
      backgroundColor,
      isNot(tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor),
    );
  });
}
