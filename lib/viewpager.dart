
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ViewPager",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ViewPager"),
        ),
        body: ViewPager(),
      ),
    );
  }

}

class ViewPager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ViewPagerState();
  }

}

class ViewPagerState extends State<ViewPager>{

  PageController _pageController;
  int _index=0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _index,
      viewportFraction: 1,
      keepPage: true,
    );

    _timer = Timer.periodic(Duration(
      seconds: 2
    ), (timer){
      _index++;
      _pageController.animateToPage(_index%5, duration: Duration(milliseconds: 16),
          curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      reverse: false,
      controller: _pageController,
      physics: BouncingScrollPhysics(),
      pageSnapping: true,
      onPageChanged: (index){
        print("index:${index}");
      },
      children: <Widget>[
        Container(
          color: Colors.tealAccent,
          child: Center(
            child: Text(
              "第一页",
              style: TextStyle(color: Colors.red,fontSize: 20.0),
            ),
          ),
        ),
        Container(
          color: Colors.tealAccent,
          child: Center(
            child: Text(
              "第二页",
              style: TextStyle(color: Colors.red,fontSize: 20.0),
            ),
          ),
        ),
        Container(
          color: Colors.tealAccent,
          child: Center(
            child: Text(
              "第三页",
              style: TextStyle(color: Colors.red,fontSize: 20.0),
            ),
          ),
        ),
        Container(
          color: Colors.tealAccent,
          child: Center(
            child: Text(
              "第四页",
              style: TextStyle(color: Colors.red,fontSize: 20.0),
            ),
          ),
        ),
        Container(
          color: Colors.tealAccent,
          child: Center(
            child: Text(
              "第五页",
              style: TextStyle(color: Colors.red,fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }
}
