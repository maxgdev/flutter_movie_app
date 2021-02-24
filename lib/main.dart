import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the Debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      home: MyHomePage(title: 'Flutter Movie App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title),
            backgroundColor: Colors.blueGrey.shade900),
        // background color for body/rest of app
        backgroundColor: Colors.blueGrey.shade400,
        body: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              title: Text("Movie title"),
            ),
          );
        }));
  }
}
