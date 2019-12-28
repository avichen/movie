import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie/model/in_theater.dart';
import 'package:http/http.dart' as http;

class InTheaterPic extends StatefulWidget {
  final String imagePath;

  const InTheaterPic({Key key, this.imagePath}) : super(key: key);

  @override
  _InTheaterPicState createState() => _InTheaterPicState();
}

class _InTheaterPicState extends State<InTheaterPic> {
  List<Subjects> subitems = new List();
  int _selectIndex = 0;
  ScrollController _scrollController = new ScrollController();

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
    _scrollController.addListener((){
      print(_scrollController.offset);
      // if(_scrollController.offset > 150.0 && _scrollController.offset < 220)
    });
  }


  @override
  Widget build(BuildContext context) {

    final _screenWidth = MediaQuery.of(context).size.width;
    print(_screenWidth);
    return subitems.length > 0
        ? Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10.0),
                height: 320.0,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: subitems.length,
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    final item = subitems[index];
                    // _selectIndex = index;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectIndex = index;
                            // print("select Index: ${_selectIndex}");
                          });
                        },
                        child: Material(
                          color: Colors.white,
                          shadowColor: Colors.grey,
                          elevation: 4.0,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: Container(
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              child: Image.network(item.images.medium),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
                        text: subitems[_selectIndex].genres.join('/') + "  |  " + subitems[_selectIndex].durations[0].toString() + "  |  " + subitems[_selectIndex].mainlandPubdate,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "豆瓣评分: " + subitems[_selectIndex].rating.average + "/" + subitems[_selectIndex].rating.max.toString(),
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
