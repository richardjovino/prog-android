import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.black,
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas"),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  _corpo() {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            height: 350,
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _texto('Desenvolvedor BackEnd'),
                  _texto1('Salario: 3.000,00'),
                  _texto1(
                      'Descrição: Conhecimentos basicos em NodeJS, javascript, Java, c++, c#, experiencia de 5 anos na área Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  _texto1('Contato: 13 98765-4321'),
                ]),
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _texto('Engenheiro de dados'),
                  _texto1('Salario: 3.000,00'),
                  _texto1(
                      'Descrição: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  _texto1('Contato: 13 98765-4321'),
                ]),
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _texto('Engenheiro de Software'),
                  _texto1('Salario: 3.000,00'),
                  _texto1(
                      'Descrição: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  _texto1('Contato: 13 98765-4321'),
                ]),
          ),
          Container(
            height: 250,
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _texto('Desenvolvedor FrontEnd'),
                  _texto1('Salario: 3.000,00'),
                  _texto1(
                      'Descrição: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  _texto1('Contato: 13 98765-4321'),
                ]),
          ),
          
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

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      style: TextStyle(color: Colors.blue, fontSize: 25.0),
    );
  }

  _texto1(textoParaExibir) {
    return Text(
      textoParaExibir,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }
}
