import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:carros/entity/carro.dart';

class CarroApi{

  static Future<List<Carro>> list(tipo) async{
    try {
      final url = 'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';
      final response = await http.get(url);
      final list = convert.json.decode(response.body);
      return list.map<Carro>((carro) => Carro.fromMap(carro)).toList();
    }catch(error){
      print(error);
      throw error;
    }
  }

}