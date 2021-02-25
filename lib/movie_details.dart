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

      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.images[0],)
        ],
      ),
      // body: Column(
      //   children: [
      //     // movieImage(movie.images[0]),
      //     Center(
      //       child: Container(
      //         child: RaisedButton(
      //             child: Text(movie.title),
      //             onPressed: () => {Navigator.pop(context)}),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              // use media query to find size of screen width
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover
                )
              ),
            ),
            Icon(
              Icons.play_circle_fill_outlined, 
              size: 100,
              color: Colors.white,
            ),
            
          ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(            
                colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
                )
            ),
            height: 80,
          ),
      ],
    );
  }
}