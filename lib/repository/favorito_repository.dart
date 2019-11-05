import 'package:carros/entity/favorito.dart';
import 'package:carros/utils/sql/base_repository.dart';

class FavoritoRepository extends BaseRepository<Favorito>{

  @override
  Favorito fromMap(Map<String,dynamic> map) {
    return Favorito.fromMap(map);
  }

  @override
  // TODO: implement table
  String get table => "favorito";

}