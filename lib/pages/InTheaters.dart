import 'package:flutter/material.dart';
import 'package:movie/common/in_theater_widget.dart';

class InTheaters extends StatefulWidget {
  @override
  _InTheatersState createState() => _InTheatersState();
}

class _InTheatersState extends State<InTheaters> {
  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Text(
                      date.year.toString() + '-' + date.month.toString() + '-' + date.day.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "In Theater Now",
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Center(
              // child: InTheaterPic(),
              child: InTheaterWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
