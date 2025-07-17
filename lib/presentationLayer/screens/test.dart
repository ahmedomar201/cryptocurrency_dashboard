import 'package:flutter/material.dart';

class CryptoDashboardScreen extends StatelessWidget {
  final List<Map<String, String>> coins = const [
    {"symbol": "BTC", "name": "Bitcoin"},
    {"symbol": "ETH", "name": "Ethereum"},
    {"symbol": "XRP", "name": "Ripple"},
    {"symbol": "BNB", "name": "Binance Chain"},
    {"symbol": "SOL", "name": "Solana"},
    {"symbol": "DOGE", "name": "Dogecoin"},
    {"symbol": "TRON", "name": "Tron Network"},
    {"symbol": "ADA", "name": "Cardano"},
    {"symbol": "HYPE", "name": "Hyperliquid"},
    {"symbol": "XLM", "name": "Stellar"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Dashboard'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: coins.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final coin = coins[index];
          return CryptoCard(symbol: coin['symbol']!, name: coin['name']!);
        },
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  final String symbol;
  final String name;

  const CryptoCard({required this.symbol, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(symbol, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(name, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("--", style: TextStyle(fontSize: 18)), // placeholder for price
                SizedBox(height: 4),
                Text("Volume: --", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
