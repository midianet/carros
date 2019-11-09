import 'dart:convert' as convert;

import 'package:carros/entity/entity.dart';

class Carro extends Entity {
  static final String CLASSICO = "CLASSICO";
  static final String ESPORTIVO = "ESPORTIVO";
  static final String LUXO = "LUXO";

  int id;
  String nome;
  String tipo;
  String descricao;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;
  int peso;
  int velocidade;
  int potencia;
  int ranking;

  Carro.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    tipo = map['tipo'];
    descricao = map['descricao'];
    urlFoto = map['urlFoto'];
    urlVideo = map['urlVideo'];
    latitude = map['latitude'];
    longitude = map['longitude'];
    peso = map['peso'];
    velocidade  = map['velocidade'];;
    potencia = map['potencia'];
    ranking = map['ranking'];
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
    data['velocidade'] = this.velocidade;
    data['potencia'] = this.potencia;
    data['peso'] = this.peso;
    data['ranking'] = this.ranking;
    return data;
  }

  String get foto {
    if (urlFoto != null) return urlFoto;
    return "assets/images/carro.jpg";
  }
}
