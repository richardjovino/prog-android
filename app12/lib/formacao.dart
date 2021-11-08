import 'package:flutter/material.dart';
 
class Formacao extends StatelessWidget {
  const Formacao({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
 
  _body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _texto("Bacharel: Engenharia Mecatronica"),
          _texto("Cursando: Análise e Desenvolvimento de Sistmeas"),
          _texto("Curso Técnico: Automacao Industrial"),
          _texto("Cursos Adicionais: Nodejs, git, autocad, industria 4.0")
        ],
      ),
    );
  }
}
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }
