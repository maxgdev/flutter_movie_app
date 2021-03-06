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
          MovieDetailsThumbnail(
            thumbnail: movie.images[0],
          ),
          MovieDetailsPoster(
            movie: movie,
          ),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieExtraPosters(posters: movie.images,)
        ],
      ),
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
                      image: NetworkImage(thumbnail), fit: BoxFit.cover)),
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
                  end: Alignment.bottomCenter)),
          height: 80,
        ),
      ],
    );
  }
}

class MovieDetailsPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(
            poster: movie.images[1].toString(),
          ),
          SizedBox(width: 16),
          Expanded(
            child: MovieDetailsHeader(movie: movie),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(poster),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year} . ${movie.genre}".toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey.shade900),
        ),
        Text(
          "${movie.title}".toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 26,
              color: Colors.blueGrey.shade900),
        ),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(text: movie.plot),
              TextSpan(
                  text: "More...",
                  style: TextStyle(color: Colors.lightBlueAccent))
            ])),
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(children: [
        MovieField(field: "Cast", value: movie.actors),
        MovieField(field: "Directors", value: movie.director),
        MovieField(field: "Awards", value: movie.awards),
      ]),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field : ",
            style: TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontWeight: FontWeight.w300)),
        Expanded(
          child: Text(value,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w300)),
        ),
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieExtraPosters extends StatelessWidget {
  final List posters;

  const MovieExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("More MOvie Posters".toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.black38
          )
          ),
        ),
        Container(
          height: 180,
          // padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8,), 
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width /4,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(posters[index]),
                  fit: BoxFit.cover
                  ),
                ),
              ),
            ) 
            ),
        ),
      ],
    );
  }
}
