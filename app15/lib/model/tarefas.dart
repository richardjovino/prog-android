import 'package:app15/helper/tarefasHelper.dart';
 
class Tarefas {
  int id;
  String titulo;
  String data;
 
  Tarefas(this.titulo, this.data);
 
  Tarefas.fromMap(Map map) {
    this.id = map["id"];
    this.titulo = map["titulo"];
    this.data = map["data"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "titulo": this.titulo,
      "data": this.data,
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
