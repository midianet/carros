
import 'package:carros/block/favorito_bloc.dart';
import 'package:carros/entity/carro.dart';
import 'package:carros/entity/favorito.dart';
import 'package:carros/repository/carro_repository.dart';
import 'package:carros/repository/favorito_repository.dart';
import 'package:provider/provider.dart';

class FavoritoService{

  static Future<bool> favoritar(context,Carro carro) async{
    final favorito = Favorito.fromCarro(carro);
    final repository = FavoritoRepository();
    final exists = await repository.exists(favorito.id);
    if(exists){
      repository.delete(favorito.id);
      Provider.of<FavoritoBloc>(context).fetch();
      return false;
    }else {
      repository.save(favorito);
      Provider.of<FavoritoBloc>(context).fetch();
      return true;
    }
  }

  static Future<bool> isFavorito(Carro carro) async{
    return await FavoritoRepository().exists(carro.id);
  }

  static Future<List<Carro>> list() async{
    return CarroRepository().query("select * from carro c, favorito f where c.id = f.id");
  }

}