
import 'package:carros/entity/entity.dart';

import 'carro.dart';

class Favorito extends Entity {

  int id;
  String nome;

  Favorito.fromCarro(Carro carro){
    id = carro.id;
    nome = carro.nome;
  }

  Favorito.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }

}