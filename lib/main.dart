import 'package:carros/block/favorito_bloc.dart';
import 'package:carros/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
      ),
    );
  }
}
