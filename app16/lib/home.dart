import 'package:flutter/material.dart';
import 'package:app16/helper/MercadoHelper.dart';
import 'package:app16/model/Mercado.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _mercadoriaController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();
  var _db = MercadoHelper();
  List<Mercado> _mercado = List<Mercado>();
 
  _exibirTelaCadastro({Mercado mercado}) {
    String textoSalvarAtualizar = "";
    if (mercado == null) {
      //salvando
      _mercadoriaController.text = "";
      _quantidadeController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _mercadoriaController.text = mercado.mercadoria;
      _quantidadeController.text = mercado.quantidade;
      textoSalvarAtualizar = "Atualizar";
    }
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar mercadoria"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _mercadoriaController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Mercadoria", hintText: "Digite mercadoria..."),
                ),
                TextField(
                  controller: _quantidadeController,
                  decoration: InputDecoration(
                      labelText: "Quantidade", hintText: "Digite quantidade..."),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarMercado(mercadoSelecionado: mercado);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarMercado() async {
    List mercadoRecuperadas = await _db.recuperarMercado();
 
    List<Mercado> listaTemporaria = List<Mercado>();
    for (var item in mercadoRecuperadas) {
      Mercado mercado = Mercado.fromMap(item);
      listaTemporaria.add(mercado);
    }
 
    setState(() {
      _mercado = listaTemporaria;
    });
    listaTemporaria = null;

  }
 
  _salvarAtualizarMercado({Mercado mercadoSelecionado}) async {
    String mercadoria = _mercadoriaController.text;
    String quantidade = _quantidadeController.text;
 
    if (mercadoSelecionado == null) {
      //salvar
      Mercado mercado =
          Mercado(mercadoria, quantidade, DateTime.now().toString());
      int resultado = await _db.salvarMercado(mercado);
    } else {
      //atualizar
      mercadoSelecionado.mercadoria = mercadoria;
      mercadoSelecionado.quantidade = quantidade;
      mercadoSelecionado.data = DateTime.now().toString();
      int resultado = await _db.atualizarMercado(mercadoSelecionado);
    }
 
    _mercadoriaController.clear();
    _quantidadeController.clear();
 
    _recuperarMercado();
  }
 
  _formatarData(String data) {
    initializeDateFormatting("pt_BR");
 
    //Year -> y month-> M Day -> d
    // Hour -> H minute -> m second -> s
    //var formatador = DateFormat("d/MMMM/y H:m:s");
    var formatador = DateFormat.yMd("pt_BR");
 
    DateTime dataConvertida = DateTime.parse(data);
    String dataFormatada = formatador.format(dataConvertida);
 
    return dataFormatada;
  }
 
  _removerMercado(int id) async {
    await _db.removerMercado(id);
 
    _recuperarMercado();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarMercado();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Mercado"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _mercado.length,
                  itemBuilder: (context, index) {
                    final mercado = _mercado[index];
 
                    return Card(
                      child: ListTile(
                        title: Text("${mercado.mercadoria} - (${mercado.quantidade})"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(mercado: mercado);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerMercado(mercado.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}
