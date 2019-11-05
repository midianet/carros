import 'dart:async';

import 'package:carros/block/favorito_bloc.dart';
import 'package:carros/entity/carro.dart';
import 'package:carros/widget/carro_lista.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatefulWidget {

  @override
  _FavoritoPageViewState createState() => _FavoritoPageViewState();
}

class _FavoritoPageViewState extends State<FavoritosPage> with AutomaticKeepAliveClientMixin<FavoritosPage> {


  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Provider.of<FavoritoBloc>(context, listen: false).fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: Provider.of<FavoritoBloc>(context).stream,
      builder: (context,snapshot){
        if(snapshot.hasError) return Center(child: Text("Não foi possível listar favoritos", style: TextStyle(color: Colors.red)));
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
        List<Carro> carros = snapshot.data;
        if(carros.isEmpty) return Center(child: Text("Você não tem nenhum carro  favorito"));
        return Container(
          padding: EdgeInsets.only(left: 14, right: 14),
          child: RefreshIndicator(
            onRefresh:  _onRefresh,
            child: CarroLista(carros),
          ),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return Provider.of<FavoritoBloc>(context).fetch();
  }

}