import 'dart:convert' as convert;

import 'package:carros/entity/entity.dart';

class Carro extends Entity {
  static final String CLASSICOS = "classicos";
  static final String ESPORTIVOS = "esportivos";
  static final String LUXO = "luxo";

  int id;
  String nome;
  String tipo;
  String descricao;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;
  int peso = 1070;
  int velocidade = 187;
  int potencia = 180;
  int ranking = 8;

  Carro.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    tipo = map['tipo'];
    descricao = map['descricao'];
    urlFoto = map['urlFoto'];
    urlVideo = map['urlVideo'];
    latitude = map['latitude'];
    longitude = map['longitude'];
  }

  String toJson() {
    return convert.json.encode(toMap());
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['urlFoto'] = this.urlFoto;
    data['latitude'] = this.latitude;
    data['urlVideo'] = this.urlVideo;
    data['longitude'] = this.longitude;
    return data;
  }

  String get foto {
    if (urlFoto != null) return urlFoto;
    return "assets/images/carro.jpg";
  }
}
