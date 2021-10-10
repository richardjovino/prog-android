import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  
 int _counter = 0;
 void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
   void _decrementCounter() {
    setState(() {
      if(_counter != 0){
      _counter--;
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Contador de pessoas"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[ 
          _texto('$_counter'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _botao1(),
              _botao2(),
            ]
          )
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
 
  _botao1() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _incrementCounter,
          child: Text("+",
              style: TextStyle(color: Colors.white, fontSize: 10.0)),
          color: Colors.blue,
        ),
      ),
    );
  }
 
   _botao2() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _decrementCounter,
          child: Text("-",
              style: TextStyle(color: Colors.white, fontSize: 10.0)),
          color: Colors.red,
        ),
      ),
    );
  }
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 100.0),
    );
  }
}
