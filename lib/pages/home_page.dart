import 'package:carros/entity/carro.dart';
import 'package:carros/pages/carros_page.dart';
import 'package:carros/pages/favoritos_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Coleção de Carros'),
          centerTitle: true,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontSize: 12),
            tabs: <Widget>[
              Tab(text: "Esportivos", icon: Icon(Icons.directions_car)),
              Tab(text: "Clássicos", icon: Icon(Icons.directions_car)),
              Tab(text: "Luxo", icon: Icon(Icons.directions_car)),
              Tab(text: "Favoritos", icon: Icon(Icons.favorite)),
            ],
          ),
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return TabBarView(
      children: <Widget>[
        CarrosPage.tipo(Carro.ESPORTIVO),
        CarrosPage.tipo(Carro.CLASSICO),
        CarrosPage.tipo(Carro.LUXO),
        FavoritosPage(),
      ],
    );
  }
}