import 'package:flutter/material.dart';
class XAppBar extends PreferredSize {

  final Widget child;
  final String title;
  final Widget leading;
  final List<Widget> actions;
  static final double navHeight = 44.0;

  XAppBar({Key key,this.child,this.title,this.leading,this.actions}) : super(key:key,child:child,preferredSize:Size.fromHeight(navHeight));

  @override
  PreferredSize build(BuildContext context){
    return null;
  }
  
}