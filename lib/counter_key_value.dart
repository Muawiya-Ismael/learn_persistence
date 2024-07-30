import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterUsingKeyValue extends StatefulWidget {
  const CounterUsingKeyValue({super.key});

  @override
  State<CounterUsingKeyValue> createState() => _CounterUsingKeyValueState();
}

class _CounterUsingKeyValueState extends State<CounterUsingKeyValue> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    getCounterValue(); // Load counter value from shared preferences
  }

  void getCounterValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? retrievedCounter = prefs.getInt('counter');
    setState(() { // Update state after retrieving the value
      _counter = retrievedCounter ?? 911;
    });// Update _counter with retrieved value or 0
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      saveCounterValue(_counter);
    });
  }

  void saveCounterValue(int counter) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter);
  }

  void resetCounterValue(){
    setState(() {
      _counter = 0;
      saveCounterValue(0);
    });
  }

  void removeCounterEntry() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Key-Value"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10,),
            FloatingActionButton(
              onPressed: resetCounterValue,
              tooltip: 'reset',
              child: const Icon(Icons.repeat),
            ),
            const SizedBox(height: 10,),
            FloatingActionButton(
              onPressed: removeCounterEntry,
              tooltip: 'remove',
              child: const Icon(Icons.remove),
            ),
          ],
        )
    );
  }
}



