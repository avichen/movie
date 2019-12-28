import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movie/model/in_theater.dart';
import 'package:movie/model/movie_details.dart';

class MovieDetailsWidget extends StatefulWidget {
  final Subjects subjects;

  MovieDetailsWidget({this.subjects});

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  Future<MovieDetails> movieDetailsFuture;

  Future<MovieDetails> getMovieDetails() async {
    var url =
        "http://api.douban.com/v2/movie/subject/${widget.subjects.id}?apikey=0df993c66c0c636e29ecbb5344252a4a";
    var client = new http.Client();
    var resp = await client.get(url);
    var jsonResp = json.decode(resp.body);

    // String jsonString = await rootBundle.loadString("assets/data/in_theaters.json");
    // final jsonResp = json.decode(jsonString);
    MovieDetails movieDetails = new MovieDetails.fromJson(jsonResp);
    // print(inTheater.subjects.runtimeType);
    return movieDetails;
  }

  @override
  void initState() {
    movieDetailsFuture = getMovieDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
