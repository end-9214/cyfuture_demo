import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const ResultScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alternatives = data['alternatives'] as List<dynamic>? ?? [];
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Result')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text('Barcode: ${data['barcode'] ?? 'N/A'}', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  if (data['ecoscore_data'] != null)
                    Text('EcoScore: ${data['ecoscore_data']}', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('Health Score: ${data['health_score']}/10', style: const TextStyle(fontSize: 16)),
                  Text('Carbon Footprint: ${data['carbon_footprint']} kg CO₂', style: const TextStyle(fontSize: 16)),
                  Text('Water Usage: ${data['water_usage']} L', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.green[50],
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Icon(Icons.insights, color: Colors.green),
                          const SizedBox(width: 8),
                          Expanded(child: Text(data['insights'] ?? '', style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('Alternatives', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...alternatives.map((alt) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.eco, color: Colors.blue),
                    title: Text(alt['name'] ?? ''),
                    subtitle: Text('Barcode: ${alt['barcode']}\nHealth Score: ${alt['health_score']}/10'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
