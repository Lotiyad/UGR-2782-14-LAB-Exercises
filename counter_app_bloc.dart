import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}

class CounterAppBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Counter App - BLoC')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<CounterBloc, int>(
                  builder: (context, count) => Text(
                    'Count: $count',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterEvent.decrement),
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
  runApp(CounterAppBloc());
}
