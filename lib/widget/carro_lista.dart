import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/entity/carro.dart';
import 'package:carros/pages/carro_page.dart';
import 'package:carros/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarroLista extends StatelessWidget {

  List<Carro> carros;

  CarroLista(this.carros);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: carros != null ? carros.length : 0,
      itemBuilder: (context, index) {
        var carro = carros[index];
        return InkWell(
          child: _cardCarro(context, carro),
          onLongPress: () => _onClickCarro(context, carro),
        );
      },
    );
  }

  _cardCarro(context, carro) {
    return Card(
      color: Colors.grey[80],
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              carro.nome,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: CachedNetworkImage(imageUrl: carro.foto, height: 150),
            ),
            ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Detalhes'),
                    onPressed: () => _onClickCarro(context, carro),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onClickCarro(context, carro) {
    push(context, CarroPage(carro));
  }
}
