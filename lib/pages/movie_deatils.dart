import 'package:barcode_scan/barcode_scan.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/in_theater.dart';

class MovieDetails extends StatefulWidget {
  final Subjects subjects;

  MovieDetails({this.subjects});

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  String barcode = "";
  
  @override
  Widget build(BuildContext context) {
    // return Hero(tag: widget.subjects.id,child: MovieDetailsWidget(subjects: widget.subjects,));
    print(widget.subjects.id);
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          // maxHeight: MediaQuery.of(context).size.height * 0.4,
          minWidth: double.infinity,
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Hero(
              tag: 'movieImage'+widget.subjects.id,
              child: Image(
                image:
                    CachedNetworkImageProvider(widget.subjects.images.medium),
                height: 600.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 30.0,
                  left: 20.0,
                  right: MediaQuery.of(context).size.width - 20.0,
                  bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 32.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.40),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                  child: new MaterialButton(
                      onPressed: scan, child: new Text("Scan")),
                  padding: const EdgeInsets.all(8.0),
                ),
                Text(barcode),
                  ],
                ),
              ),
            ),
            // Container(),
            // MovieDetailsWidget(
            //   subjects: widget.subjects,
            // ),
          ],
        ),
      ),
    );
    // SizedBox(height: 500),
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}

