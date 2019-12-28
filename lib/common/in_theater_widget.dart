import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/in_theater.dart';
import 'package:http/http.dart' as http;
import 'package:movie/pages/movie_deatils.dart';

class InTheaterWidget extends StatefulWidget {
  @override
  _InTheaterWidgetState createState() => _InTheaterWidgetState();
}

class _InTheaterWidgetState extends State<InTheaterWidget>
    with TickerProviderStateMixin {
  List<Subjects> subitems = new List();
  int _selectIndex = 0;

  Future getInTheaters() async {
    var url =
        "http://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start=0&count=10";
    var client = new http.Client();
    var resp = await client.get(url);
    var jsonResp = json.decode(resp.body);

    // String jsonString = await rootBundle.loadString("assets/data/in_theaters.json");
    // final jsonResp = json.decode(jsonString);
    InTheater inTheater = new InTheater.fromJson(jsonResp);
    // print(inTheater.subjects.runtimeType);

    setState(() {
      if (inTheater.subjects.length > 0) {
        subitems.addAll(inTheater.subjects);
      }
    });
  }

  @override
  void initState() {
    getInTheaters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(subitems[_selectIndex].durations.length);
    final _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    // final CurvedAnimation curve = CurvedAnimation(
    // parent: _animationController, curve: Curves.elasticOut);
    var _animation = Tween<double>(begin: 1, end: 100).animate(
        _animationController)
      ..addStatusListener((status) {
        print(status);
        print('${_animationController.value}-${_animationController.value}');
      });
    return subitems.length > 0
        ? Column(
            children: <Widget>[
              CarouselSlider(
                // height: 400.0,
                aspectRatio: 1.0,
                enlargeCenterPage: true,
                initialPage: 0,
                onPageChanged: (index) {
                  setState(() {
                    _selectIndex = index;
                  });
                },
                items: subitems.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          // print('onPanDown');
                          // _animationController.forward();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetails(
                                  subjects: item,
                                ),
                              ));
                          // print(item.id);
                        },
                        child: ScaleTransition(
                          alignment: Alignment.center,
                          scale: _animation,
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 1.0),
                            width: MediaQuery.of(context).size.width - 100,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              child: Hero(
                                tag: 'movieImage'+item.id,
                                child: Image.network(
                                  item.images.large,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: subitems[_selectIndex].title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: subitems[_selectIndex].genres.join('/') +
                            "  |  " +
                            (subitems[_selectIndex].durations.length > 0
                                ? subitems[_selectIndex].durations[0].toString()
                                : 'N/A') +
                            "  |  " +
                            subitems[_selectIndex].mainlandPubdate,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "豆瓣评分: " +
                            subitems[_selectIndex].rating.average +
                            "/" +
                            subitems[_selectIndex].rating.max.toString(),
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}
