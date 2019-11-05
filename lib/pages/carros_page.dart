import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/block/carro_bloc.dart';
import 'package:carros/entity/carro.dart';
import 'package:carros/widget/carro_lista.dart';
import 'package:carros/pages/carro_page.dart';
import 'package:carros/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarrosPage extends StatefulWidget {

  String tipo;

  CarrosPage.tipo(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();

}

class _CarrosPageState extends State<CarrosPage> with AutomaticKeepAliveClientMixin<CarrosPage> {

  final _block = CarroBloc();

  String get tipo => widget.tipo;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _block.fetch(tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder(
      stream: _block.stream,
      builder: (context,snapshot){
        if(snapshot.hasError) return Center(child: Text("Não foi possível listar os carros", style: TextStyle(color: Colors.red)));
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
        var carros = snapshot.data;
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
    return _block.fetch(tipo);
  }

  @override
  void dispose(){
    super.dispose();
    _block.dispose();
  }

}
