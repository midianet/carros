import 'package:carros/block/carro_bloc.dart';
import 'package:carros/widget/carro_lista.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarrosPage extends StatefulWidget {
  String tipo;

  CarrosPage.tipo(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
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
      builder: (context, snapshot) {
        if (snapshot.hasError) return _noContent();
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        var carros = snapshot.data;
        return Container(
          padding: EdgeInsets.only(left: 14, right: 14),
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: CarroLista(carros),
          ),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _block.fetch(tipo);
  }

  _noContent() {
    return Center(
      child: Container(
        height: 120,
        child: Column(
          children: <Widget>[
            Text( "Não foi possível listar os carros", style: TextStyle(fontSize: 18, color: Colors.red,)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RawMaterialButton(
                onPressed: () => _block.fetch(tipo),
                child: new Icon(
                  Icons.refresh,
                  color: Colors.blue,
                  size: 35.0,
                ),
                shape: new CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _block.dispose();
  }
}
