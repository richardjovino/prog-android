import 'package:flutter/material.dart';
import 'package:app15/helper/tarefasHelper.dart';
import 'package:app15/model/tarefas.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  var _db = TarefasHelper();
  List<Tarefas> _tarefas = List<Tarefas>();
 
  _exibirTelaCadastro({Tarefas tarefa}) {
    String textoSalvarAtualizar = "";
    if (tarefa == null) {
      //salvando
      _tituloController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _tituloController.text = tarefa.titulo;
      textoSalvarAtualizar = "Atualizar";
    }
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar tarefas"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Título", hintText: "Digite título..."),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarTarefas(tarefaSelecionada: tarefa);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarTarefas() async {
    List tarefasRecuperadas = await _db.recuperarTarefas();
 
    List<Tarefas> listaTemporaria = List<Tarefas>();
    for (var item in tarefasRecuperadas) {
      Tarefas tarefas = Tarefas.fromMap(item);
      listaTemporaria.add(tarefas);
    }
 
    setState(() {
      _tarefas = listaTemporaria;
    });
    listaTemporaria = null;
 
  
  }
 
  _salvarAtualizarTarefas({Tarefas tarefaSelecionada}) async {
    String titulo = _tituloController.text;

 
    if (tarefaSelecionada == null) {
  
      Tarefas tarefa =
          Tarefas(titulo, DateTime.now().toString());
      int resultado = await _db.salvarTarefas(tarefa);
    } else {
      //atualizar
      tarefaSelecionada.titulo = titulo;
      tarefaSelecionada.data = DateTime.now().toString();
      int resultado = await _db.atualizarTarefas(tarefaSelecionada);
    }
 
    _tituloController.clear();
 
    _recuperarTarefas();
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
 
  _removerTarefas(int id) async {
    await _db.removerTarefas(id);
 
    _recuperarTarefas();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarTarefas();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = _tarefas[index];
 
                    return Card(
                      child: ListTile(
                        title: Text(tarefa.titulo),
                        subtitle: Text(
                            "${_formatarData(tarefa.data)}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(tarefa: tarefa);
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
                                _removerTarefas(tarefa.id);
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
