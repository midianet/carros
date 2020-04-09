import 'dart:convert' as convert;

import 'package:carros/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:carros/entity/carro.dart';

class CarroApi{

  static Future<List<Carro>> list(tipo) async{
    try {
      final String host = apiUrl();
      final url =  'http://$host/carros?tipo=$tipo';
      final response = await http.get(url);
      final list =  convert.json.decode(convert.utf8.decode(response.bodyBytes));
      return list.map<Carro>((carro) => Carro.fromMap(carro)).toList();
    }catch(error){
      print(error);
      throw error;
    }
  }

}