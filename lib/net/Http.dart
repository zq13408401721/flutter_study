
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "网络数据请求",
      home: Http(),
    );
  }

}

class Http extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return HttpState();
  }

}

class HttpState extends State<Http>{

  String data="正在加载数据";
  HttpState();

  @override
  void initState(){
    super.initState();
    DioUtil.request("http://cdwan.cn/api/index").then((result){
      print(result);
      setState(() {
        data = result.data;
      });
    });
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("网络数据请求"),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}


/************************网络请求*******************/
class DioUtil{
  static Dio dio = new Dio();
  //请求数据
  static Future<Response> request(url) async{
    try{
      Response response;
      response = await dio.get(url);
      return response;
    }catch(e){
      print("网络异常${e}");
    }
  }
}
