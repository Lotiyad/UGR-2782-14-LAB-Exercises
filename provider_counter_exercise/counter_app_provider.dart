import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

class CounterAppProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Counter App - Provider')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<Counter>(
                  builder: (context, counter, _) => Text(
                    'Count: ${counter.count}',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      Provider.of<Counter>(context, listen: false).decrement(),
                  child: Text('Decrement'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(CounterAppProvider());
}
