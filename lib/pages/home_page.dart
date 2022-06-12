import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo {
  final String name;
  final double price;

  ProductInfo(this.name, this.price);
}

final products = [
  ProductInfo('Wireless mouse', 0.3),
  ProductInfo('Keyboard', 5.8),
  ProductInfo('Camera', 8),
  ProductInfo('Speaker', 4),
  ProductInfo('iPad', 5),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 80)),
            Text(products[_currentProductIndex].name),
            const Padding(padding: EdgeInsets.only(top: 40)),
            SizedBox(
              width: 200,
              child: TextField(
                key: const Key("priceText"),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_currentProductIndex < 4) {
                      _currentProductIndex++;
                    }
                  });
                },
                child: const Text("Check"))
          ],
        ),
      ),
    );
  }
}
