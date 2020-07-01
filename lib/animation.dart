
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "动画演示",
      home: MyAnimation(),
    );
  }

}

class MyAnimation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAnimationState();
  }

}

class MyAnimationState extends State<MyAnimation> with TickerProviderStateMixin{

  AnimationController _animationController; //动画控制器
  CurvedAnimation _curvedAnimation; //曲线动画，动画插值
  bool forward = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    );
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastLinearToSlowEaseIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画演示"),
      ),
      body: Center(
        child: RotationTransition(
          turns: _curvedAnimation,
          child: FlutterLogo(
            size: 200.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(forward)
            _animationController.forward(); //向前播放动画
          else
            _animationController.reverse(); //向后播放动画
          forward = !forward;
        },
        tooltip: 'fade',
        child: Column(
          children: <Widget>[
            Icon(Icons.track_changes),
            Icon(Icons.av_timer),
          ],
        ),
      ),
    );
  }

}

