import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BitcoinPriceScreen extends StatefulWidget {
  const BitcoinPriceScreen({super.key});

  @override
  BitcoinPriceScreenState createState() => BitcoinPriceScreenState();
}

class BitcoinPriceScreenState extends State<BitcoinPriceScreen> {
  final TextEditingController controller = TextEditingController();

  Future<void> fetchBitcoinPrice() async {
    const url =
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final price = data['bitcoin']['usd'].toString();
        setState(() {
          controller.text = "Bitcoin-Preis: $price";
        });
      } else {
        setState(() {
          controller.text = "Fehler: ${response.statusCode}";
        });
      }
    } catch (error) {
      setState(() {
        controller.text = "Fehler: $error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ergebnis zeigt dir Bober gleich",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchBitcoinPrice,
              child: const Text("Bober Magic here"),
            ),
          ],
        ),
      ),
    );
  }
}
