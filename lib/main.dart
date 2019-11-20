import 'package:carros/block/favorito_bloc.dart';
import 'package:carros/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carros/utils/network.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _online = true;

  @override
  void initState() {
    super.initState();
    _checkOnline();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FavoritoBloc>(
          builder: (context) => FavoritoBloc(),
          dispose: (context, bloc) => bloc.dispose(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coleção de Carros',
        theme: ThemeData(
          primarySwatch: _isOnline(),
        ),
        home: SplashPage(),
      ),
    );
  }

  _isOnline(){
    return _online ?  Colors.blue : Colors.blueGrey;
  }

   _checkOnline() async{
    var online = await isNetworkOn();
    setState(() {
      _online = online;
    });
  }

}
