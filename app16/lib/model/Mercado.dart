import 'package:app16/helper/MercadoHelper.dart';
 
class Mercado {
  int id;
  String mercadoria;
  String quantidade;
  String data;
 
  Mercado(this.mercadoria, this.quantidade, this.data);
 
  Mercado.fromMap(Map map) {
    this.id = map["id"];
    this.mercadoria = map["mercadoria"];
    this.quantidade = map["quantidade"];
    this.data = map["data"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "mercadoria": this.mercadoria,
      "quantidade": this.quantidade,
      "data": this.data,
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
