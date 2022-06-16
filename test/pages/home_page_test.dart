import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:name_your_price/pages/home_page.dart';

void main() {
  group('Home page test', () {
    Finder checkBtn() => find.text("Check");
    Finder nextBtn() => find.text("Next");
    Finder priceInput() => find.byKey(const Key("priceText"));

    testWidgets('Click Next to iterate over the product list',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.text(products[0].name), findsOneWidget);

      for (var i = 1; i < 5; i++) {
        await tester.tap(checkBtn());
        await tester.pump();
        await tester.tap(nextBtn());
        await tester.pump();
        expect(find.text(products[i].name), findsOneWidget);
      }

      // await tester.tap(nextBtn());
      // await tester.pump();
      await tester.tap(checkBtn());
      await tester.pump();
      expect(find.text(products[4].name), findsOneWidget);
    });

    testWidgets("Check result & show next product",
        (WidgetTester tester) async {
      //run App
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      //case 1
      //don't show button Next
      expect(nextBtn(), findsNothing);
      //don't show result text
      expect(find.byKey(const Key("result")), findsNothing);
      //fill in TextField by Key
      await tester.enterText(priceInput(), "3");
      //click button Check
      await tester.tap(checkBtn());
      //reload screen
      await tester.pump();
      //show result on screen
      expect(find.text("pass"), findsOneWidget);
      //click button Next for next action click button
      //case 2
      await tester.tap(nextBtn());
      await tester.pump();
      expect(nextBtn(), findsNothing);
      expect(find.byKey(const Key("result")), findsNothing);
      await tester.enterText(priceInput(), "4");
      await tester.tap(checkBtn());
      await tester.pump();
      expect(find.text("fail"), findsOneWidget);
      //case 3
      // await tester.tap(find.text("Next"));
      // await tester.pump();
      await tester.enterText(priceInput(), "5");
      await tester.tap(checkBtn());
      await tester.pump();
      expect(find.text("pass"), findsOneWidget);
    });
  });
}
