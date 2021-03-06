import 'package:flutter/material.dart';
import './movie.dart';
import './movie_details.dart';

Widget movieCard(Movie movie, BuildContext context) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(left: 60),
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
                  Flexible(
                    child: Text(
                      movie.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("Rating: ${movie.imdbRating} / 10",
                      style: cardTextStyle()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Released: ${movie.released}",
                      style: cardTextStyle()),
                  Text(movie.runtime,
                      style: cardTextStyle()),
                  Text(movie.rated,
                      style: cardTextStyle()),
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
              builder: (context) => MovieDetails(movie: movie))) // Navigator
    },
  );
}

TextStyle cardTextStyle() {
  return TextStyle(color: Colors.grey, fontSize: 14);
}

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
