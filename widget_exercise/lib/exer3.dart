import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order details'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Completed',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          const Text(
            'Order Completed: July 24, 2024',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            'Order ID: #524120',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          const Text(
            'Order Date: 20 july, 2024,05:00pm',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'lib\asset\download (3).jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'lib\asset\download (1).jpg',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          const Text(
            'Shipping Information:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          const Text(
            'Name: Jacob jones',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          const Text(
            'Phone Number: +1987654321',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          const Text(
            'Address: 456 Elm St, City, Country',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          const Text(
            'Dress: XYZ Dress',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          const Text(
            'Payment Information:',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          const Text(
            'Payment Method: cash on delivery',
            style: TextStyle(fontSize: 16),
          ),
        ]),
      ),
    );
  }
}
