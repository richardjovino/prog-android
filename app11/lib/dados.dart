import 'package:flutter/material.dart'; 
 
class Dados extends StatelessWidget {
  String valueNome;
  String valueIdade;
  String valueSexo;
  String valueEscolaridade;
  String valueLimit;
  String valueBrasil;
  Dados({required this.valueNome, required this.valueIdade, required this.valueSexo, required this.valueEscolaridade, required this.valueLimit, required this.valueBrasil});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados Informados'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _texto(valueNome),
          _texto(valueIdade),
          _texto(valueSexo),
          _texto(valueEscolaridade),
          _texto(valueLimit),
          _texto(valueBrasil),
          _texto(''),
          RaisedButton(
            child: Text('Voltar'),
            onPressed: () => _onClickVoltar(context),
          ),
        ],
      ),
    );
  }
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }
 
  _onClickVoltar(BuildContext context) {
    Navigator.pop(context);
  }
}
