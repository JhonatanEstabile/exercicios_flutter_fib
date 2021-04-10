import 'package:exercicios_flutter_fib/models/Agenda.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AgendaRepository {
  static final AgendaRepository _singleton = new AgendaRepository();

  factory AgendaRepository() {
    return _singleton;
  }

  static _dataBaseManger() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "placar.db");
  
    var db = await openDatabase(
      localDatabase,
      version: 1,
      onCreate: (db, versiondb) {
         String sql =
          "create table agenda(id integer primary key, nome varchar, telefone varchar)";
        db.execute(sql);
      }
    );

    return db;
  }

  static Future list() async {
    Database db = await _dataBaseManger();

    List agendaLista = await db.rawQuery("SELECT * FROM agenda");
    var _agenda = [];

    for (var agenda in agendaLista) {
      var result = new Agenda(
        agenda['nome'],
        agenda['telefone']
      );

      result.id = agenda['id'];
      _agenda.add(result);
    }

    return _agenda;
  }

  static save(Agenda agenda) async {
    Database db = await _dataBaseManger();

    Map<String, dynamic> dadosAgenda = {
      "nome" : agenda.nome,
      "telefone" : agenda.telefone,
    };
  
    await db.insert("agenda", dadosAgenda);
  }

  static update(Agenda agenda) async {
    Database db = await _dataBaseManger();

    Map<String, dynamic> dadosAgenda = {
      "nome": agenda.nome,
      "telefone": agenda.telefone
    };

    db.update("agenda", dadosAgenda,
        where: "id = ?", whereArgs: [agenda.id]);
  }

  static delete(int agendaId) async {
    Database db = await _dataBaseManger();
    return await db.delete('agenda', where: 'id = ?', whereArgs: [agendaId]);
  }
}