
import 'package:carros/entity/carro.dart';
import 'package:carros/utils/sql/base_repository.dart';

class CarroRepository extends BaseRepository<Carro>{

  @override
  Carro fromMap(Map<String,dynamic> map) {
    return Carro.fromMap(map);
  }

  @override
  // TODO: implement table
  String get table => "carro";

  Future<List<Carro>> findAllByTipo(String tipo){
    return query('select * from carro where tipo =? ',[tipo]);
  }

}