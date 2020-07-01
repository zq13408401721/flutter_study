import 'package:flutter/material.dart';

void main() => runApp(cupertino());

class cupertino extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Capertino',
      theme:ThemeData(
        primarySwatch:Colors.blue,
      ),
      home:NaverBar(),
    );
  }

}

class NaverBar extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<NaverBar>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child:Text('text'),
      ),
    );
  }
}