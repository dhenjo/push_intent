import 'dart:convert';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page 12'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    // AndroidIntent intent = const AndroidIntent(
    //   action: 'android.intent.action.VIEW',
    // data:
    //     'package:com.example.receive_intent', // replace com.example.app with your applicationId
    // );

    // AndroidIntent intent = const AndroidIntent(
    //     action: 'android.intent.action.VIEW',
    //     type: 'plain/text',
    //     data: 'text example',
    //     package: 'com.example.receive_intent');
    // final encoded =
    //     Uri.encodeFull('https://example.com/invite?search= dart is');
    // AndroidIntent intent = AndroidIntent(
    //   action: 'android.intent.action.VIEW',
    // arguments: {'android.intent.extra.SUBJECT': 'I am the subject'},
    // arrayArguments: {
    //   'android.intent.extra.EMAIL': ['eidac@me.com', 'overbom@mac.com'],
    //   'android.intent.extra.CC': ['john@app.com', 'user@app.com'],
    //   'android.intent.extra.BCC': ['liam@me.abc', 'abel@me.com'],
    // },
    //   // type: 'plain/text',
    //   data: encoded,
    //   package: "com.example.receive_intent",
    // );

    // intent.launch().onError((error, stackTrace) => print("error $error"));
    // await intent.launch();

    final extras = json.encode({
      "Amount": 123,
      "Operation": "operation",
      "TransactionID": "transActionId",
    });

    final extras2 = json.encode({
      "Amount1": "Amount",
      "Operation2": "operation",
      "TransactionID3": "transActionId",
    });

    final intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      package: 'com.example.testrecvintent',
      data: extras2,
      category: "sss",
      componentName: 'com.example.testrecvintent.MainActivity',
      arguments: {"POS_EMULATOR_EXTRA": extras},
    );

    // final intent = AndroidIntent(
    //   action: 'android.intent.action.SEND',
    //   package: 'com.example.receive_intent',
    //   data: extras2,
    //   category: "sss",
    //   componentName: 'com.example.receive_intent.MainActivity',
    //   arguments: {"POS_EMULATOR_EXTRA": extras},
    // );

    await intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
