import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/XAppBar.dart';

class HomePage extends StatefulWidget{

  final String title;

  HomePage({Key key,@required this.title}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:XAppBar(title:'${widget.title}')
    );
  }

}