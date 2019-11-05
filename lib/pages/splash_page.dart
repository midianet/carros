
import 'package:carros/utils/navigator.dart';
import 'package:carros/utils/sql/database_helper.dart';
import 'package:carros/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future futureA = DatabaseHelper.getInstance().db;
    Future futureB = Future.delayed(Duration(seconds: 1));
    Future.wait([futureA, futureB]).then((List values) {
        push(context, HomePage(),replace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
