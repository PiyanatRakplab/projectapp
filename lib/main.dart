import 'package:flutter/material.dart';
import 'color.dart';
import 'mytodo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Mylist',

    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(

        child: ElevatedButton(
          child: const Text('Open List'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            );
          },
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDo',

      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),


      home: MytodoPage(),


    );

  }

}

