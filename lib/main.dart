import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/basic.dart';
import './movie.dart';
import './movie_widget.dart';

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
  final List<Movie> movieList = Movie.getMovies();

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
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return movieCard(movieList[index], context);
              // return Card(
              //   elevation: 5,
              //   color: Colors.white,
              //   child: ListTile(
              //     leading: CircleAvatar(
              //       child: Container(
              //         width: 200,
              //         height: 200,
              //         decoration: BoxDecoration(
              //             image: DecorationImage(
              //                 image: NetworkImage(movieList[index].images[0]),
              //                 fit: BoxFit.cover),
              //             color: Colors.blue,
              //             borderRadius: BorderRadius.circular(14)),
              //       ),
              //     ),
              //     trailing: Text("..."),
              //     title: Text(movieList[index].title),
              //     subtitle: Text('subtitle'),
              //     onTap: () => {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => MovieDetails(
              //                     movie: movieList[index],
              //                   ))) // Navigator
              //     },
              //   ),
              // );
            }));
  }
}




