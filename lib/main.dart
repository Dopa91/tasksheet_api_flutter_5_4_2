import 'package:flutter/material.dart';
import 'package:tasksheet_api_flutter_5_4_2/bitcoin_price_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BitcoinPriceScreen(),
    );
  }
}
