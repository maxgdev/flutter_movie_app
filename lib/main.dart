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
  final List movies = [
    "The Shawshank Redemption",
    "The Godfather",
    "The Dark Knight",
    "Pulp Fiction",
    "The Good, the Bad and the Ugly",
    "Fight Club",
    "Inception",
    "The Matrix",
    "Seven Samurai ",
    "City of God",
    "Leon",
    "Avengers: Infinity War",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title),
            backgroundColor: Colors.blueGrey.shade900),
        // background color for body/rest of app
        backgroundColor: Colors.blueGrey.shade400,
        body: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(14)
                      ),
                      // child: Text("$index"),
                      child: Text(movies[index].substring(0, 1).toUpperCase()),
                    ),
                  ),
                  title: Text(movies[index]),
                  subtitle: Text('subtitle'),
                ),
              );
            }));
  }
}
