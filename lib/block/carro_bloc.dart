import 'dart:async';

import 'package:carros/api/carro_api.dart';
import 'package:carros/entity/carro.dart';
import 'package:carros/repository/carro_repository.dart';
import 'package:carros/utils/network.dart';

class CarroBloc{

  final _streamController = StreamController<List<Carro>>();

  Stream<List<Carro>> get stream => _streamController.stream;

  Future<List<Carro>> fetch(String tipo) async {
    try {
      List<Carro> carros;
      final repository = CarroRepository();
      if(! await isNetworkOn()){
        carros = await repository.findAllByTipo(tipo);
      }else{
        carros = await CarroApi.list(tipo);
        if(carros.isNotEmpty) carros.forEach(repository.save);
      }
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