import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
 
  String infoResultado = "Classificação";
 
  void _calcularMultiplicacao() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);
 
      double resultado = n1/(n2*n2);
      if(resultado <= 18.5){
      infoResultado = 'Abaixo do Peso';
      }else if(resultado > 18.5 && resultado <= 24.9){
        infoResultado = 'Peso Normal';
      } else if(resultado > 24.9 && resultado <= 29.9){
        infoResultado = 'SobrePeso';
      } else if(resultado > 29.9 && resultado <= 34.9){
        infoResultado = 'Obesidade Grau I';
      } else if(resultado > 34.9 && resultado <= 39.9){
        infoResultado = 'Obesidade Grau II';
      } else {
        infoResultado = 'Obesidade Grau III';
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
      title: Text("Calculo de IMC"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
  _foto() {
    return Center(
      child: Image.network(
        'https://ichef.bbci.co.uk/news/640/cpsprodpb/15E02/production/_104620698_prmo_imc_br-nc.png',
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
          _campo("Peso", n1Controller),
          _campo("Altura", n2Controller),
          _botao(),
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
          child: Text("Calcular",
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
