import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:name_your_price/pages/home_page.dart';

void main() {
  group('Home page test', () {
    testWidgets('Change product name after click', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.text(products[0].name), findsOneWidget);

      for (var i = 1; i < 5; i++) {
        await tester.tap(find.text('Check'));
        await tester.pump();
        expect(find.text(products[i].name), findsOneWidget);
      }

      await tester.tap(find.text('Check'));
      await tester.pump();
      expect(find.text(products[4].name), findsOneWidget);
    });

    testWidgets("Show result after each click", (WidgetTester tester) async {
      //run App
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      //fill in TextField by Key
      await tester.enterText(find.byKey(const Key("priceText")), "0.3");
      //click button Check
      await tester.tap(find.text("Check"));
      //reload screen
      await tester.pump();
      //show result on screen
      expect(find.text("pass"), findsOneWidget);
      //click button Next for next action click button
      await tester.tap(find.text("Next"));
      await tester.pump();
      await tester.enterText(find.byKey(const Key("priceText")), "5.5");
      await tester.tap(find.text("Check"));
      await tester.pump();
    });
  });
}
