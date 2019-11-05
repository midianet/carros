import 'dart:async';
import 'package:sqflite/sqflite.dart';

import 'package:carros/entity/entity.dart';
import 'package:carros/utils/sql/database_helper.dart';

abstract class BaseRepository<T extends Entity> {

  Future<Database> get db => DatabaseHelper.getInstance().db;

  String get table;

  T fromMap(Map<String, dynamic> map);

  Future<int> save(T entity) async {
    var dbClient = await db;
    var id = await dbClient.insert(table, entity.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
    //print(id);
    return id;
  }

  Future<List<T>> findAll(){
    return query('select * from $table');
  }

  Future<List<T>> query(String sql,[List<dynamic> arguments]) async {
    final dbClient = await db;
    final list = await dbClient.rawQuery(sql,arguments);
    return list.map<T>((map) => fromMap(map)).toList();
  }

  Future<T> findById(int id) async {
    final list =  await query('select * from $table where id = ?', [id]);
    return list.length > 0 ? list.first : null;
  }

  Future<bool> exists(int id) async {
    T c = await findById(id);
    return c != null;
  }

  Future<int> count() async {
    final dbClient = await db;
    final list = await dbClient.rawQuery('select count(*) from $table');
    return Sqflite.firstIntValue(list);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $table where id = ?', [id]);
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $table');
  }
}
