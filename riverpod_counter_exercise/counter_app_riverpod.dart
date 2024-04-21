import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final counterProvider = ChangeNotifierProvider((ref) => Counter());

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

class CounterAppRiverpod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Counter App - Riverpod')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer(builder: (context, watch, _) {
                  final counter = watch(counterProvider);
                  return Text(
                    'Count: ${counter.count}',
                    style: TextStyle(fontSize: 24),
                  );
                }),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read(counterProvider).decrement(),
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
  runApp(CounterAppRiverpod());
}
