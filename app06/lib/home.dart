import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
 
  String infoResultado = "Informe os números!";
  int n2 = 0;
 
  void _calcularMultiplicacao() {
    setState(() {
      int n1 = int.parse(n1Controller.text);
      n2 = new Random().nextInt(10);
      if(n1 == n2){
        infoResultado = 'Acertou';
      } else {
        infoResultado = 'Errou';
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.purple,
      body: _corpo(),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Jogo do N° Aleatório"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
   _foto() {
    return Center(
      child: Image.network(
        'https://media.istockphoto.com/illustrations/background-of-a-question-mark-illustration-id1125504930',
        scale: 4
      )
    );
  } 
 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo("Pense em um número de 0 a 10", n1Controller),
          _botao(),
          _texto('O numero aleatório é $n2'),
          _texto(infoResultado),
        ],
      ),
    );
  }
 
  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: objController,
    );
  }
 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcularMultiplicacao,
          child: Text("Descobrir",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.black,
        ),
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
}
