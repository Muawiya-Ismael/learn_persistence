import 'package:flutter/material.dart';
import 'counter_key_value.dart';
import 'file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Pages(),
    );
  }
}

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => const CounterUsingKeyValue()
                )
              );
            },
            child:const Text("Key-Value Counter Example")),
            const SizedBox(height: 10,),
            FilledButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => FlutterDemo(storage: CounterStorage()),
                  )
              );
            },
                child:const Text("Read and Write Files Example"))
          ],
        ),
      ),
    );
  }
}


