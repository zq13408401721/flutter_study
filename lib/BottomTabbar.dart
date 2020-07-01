import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/frident/FridentPage.dart';
import 'package:flutterstudy/girl/GirlPage.dart';
import 'package:flutterstudy/home/HomePage.dart';
import 'package:flutterstudy/own/OwnPage.dart';

class BottomTabbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "直播",
      home: Tabbar(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        highlightColor: Color.fromRGBO(255, 255, 255, .5),
        splashColor: Colors.white70,
      ),
    );
  }
}

class Tabbar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabbarState();
  }
}

class _TabbarState extends State<Tabbar>{
  final List<Widget> _bars = [
    HomePage(title:"首页"),
    GirlPage(),
    FridentPage(),
    OwnPage(),
  ];
  //当前的tab索引
  int _currentIndex = 0;
  //点击tab
  void _onTapbarHandler(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _bars,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        onTap: _onTapbarHandler,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text("美女")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.disc_full),
            title: Text("朋友圈")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("我的")
          )
        ],
      ),
    );
  }
}

