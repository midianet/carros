import 'dart:async';

import 'package:carros/entity/carro.dart';
import 'package:carros/service/favorito_service.dart';

class FavoritoBloc{

  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;

  Future<List<Carro>> fetch() async {
    try {
      List<Carro> carros = await FavoritoService.list();
      _streamController.add(carros);
      return carros;
    } catch (e) {
      if(!_streamController.isClosed) _streamController.addError(e);
    }
  }

  void dispose(){
    _streamController.close();
  }

}