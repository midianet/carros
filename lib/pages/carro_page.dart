import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/entity/carro.dart';
import 'package:carros/service/favorito_service.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CarroPage extends StatefulWidget {

  Carro carro;

  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {

  Carro get carro => widget.carro;
  bool _isFavorite = false;

  @override
  void initState(){
    super.initState();
    FavoritoService.isFavorito(carro).then((favorito){
      setState((){
        _isFavorite = favorito;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.place,
              color: Colors.white,
            ),
            onPressed: _onClickMapa(),
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          CachedNetworkImage(imageUrl: carro.foto),
          _titulo(),
          Divider( color: Colors.black),
          _propriedades(),
          Divider( color: Colors.black),
          Text("Descrição",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(carro.descricao),
          ),
        ],
      ),
    );
  }

  _titulo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              carro.nome,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              carro.tipo,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 40,
                color: _isFavorite ? Colors.red : Colors.grey
              ),
              onPressed: () => _onClickFavorito(),
            ),
          ],
        ),
      ],
    );
  }

  _propriedades() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _especificacao("Peso",carro.peso,"kg"),
        _especificacao("Potência",carro.potencia, "Cv"),
        _especificacao("Velocidade Máxima",carro.velocidade, "Km/h"),
        _ranking(),
      ],
    );
  }

  _ranking(){
    double ranking = double.parse((carro.ranking * 0.1).toStringAsPrecision(1));
    return Row(
      children: <Widget>[
        Text("Ranking: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        LinearPercentIndicator(
          width: 200,
          lineHeight: 10,
          percent: ranking ,
          backgroundColor: Colors.grey,
          progressColor: Colors.blue,
        ),
      ],
    );
  }

  _especificacao(descricao,valor, metrica){
    return Row(
      children: <Widget>[
        Text("$descricao: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        Text("${valor.toString()} $metrica"),
      ],
    );
  }

  _onClickMapa() {}

  _onClickFavorito() async {
    bool ret  = await FavoritoService.favoritar(context,carro);
    setState(() {_isFavorite = ret;});
  }
}
