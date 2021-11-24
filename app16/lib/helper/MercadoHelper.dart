import 'package:app16/model/Mercado.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class MercadoHelper {
  static final String nomeTabela = "mercado";
 
  static final MercadoHelper _mercadoHelper = MercadoHelper._internal();
  Database _db;
 
  factory MercadoHelper() {
    return _mercadoHelper;
  }
 
  MercadoHelper._internal() {}
 
  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }
 
  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "mercadoria VARCHAR, "
        "quantidade VARCHAT, "
        "data DATETIME)";
    await db.execute(sql);
  }
 
  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "banco_minhas_mercadoria.db");
 
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }
 
  Future<int> salvarMercado(Mercado mercado) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, mercado.toMap());
    return resultado;
  }
 
  recuperarMercado() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY data DESC ";
    List mercado = await bancoDados.rawQuery(sql);
    return mercado;
  }
 
  Future<int> atualizarMercado(Mercado mercado) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, mercado.toMap(),
        where: "id = ?", whereArgs: [mercado.id]);
  }
 
  Future<int> removerMercado(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
