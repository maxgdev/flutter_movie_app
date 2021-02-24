import 'package:flutter/material.dart';
import './movie.dart';
import './movie_details.dart';

Widget movieCard(Movie movie, BuildContext context) {
  return InkWell(
    child: Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.black45,
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 54, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(movie.title),
                  Text("Rating: ${movie.imdbRating} / 10"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Released: ${movie.released}"),
                  Text(movie.runtime),
                  Text(movie.rated),
                ],
              )
            ],
          ),
        ),
      ),
    ),
    onTap: () => {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MovieDetails(movie: movie))) // Navigator
    },
  );
}
