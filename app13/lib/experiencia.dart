import 'package:flutter/material.dart';
 
class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);
 
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
          _texto("Emprego: Desenvolvedor Back End Jr"),
          _texto("Empresa: Enext - A Wunderman Thompson Company"),
          _texto("Inicio: Set/2021")
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
