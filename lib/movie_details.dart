import 'package:flutter/material.dart';
import './movie.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  // Note the use if the Key. Enables widget to lin k properly with calling/parent widget??
  // {} in constuector indicates novieName is optional
  const MovieDetails({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
              child: Text(movie.title),
              onPressed: () => {Navigator.pop(context)}),
        ),
      ),
    );
  }
}