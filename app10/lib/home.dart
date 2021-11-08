import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController valorController = TextEditingController();
 String dropdownValor = '';
 String dropdownValor1 = '';
 double valor2 = 0;
 String valor3 = '';
 
  void _botaoDados() {
    setState(() {
      double valor = double.parse(valorController.text);

      if(dropdownValor== 'Real' && dropdownValor1== 'Dolar'){
        valor2 = valor / 5.68;
        valor3 = valor2.toStringAsFixed(2);
      }else if(dropdownValor== 'Real' && dropdownValor1== 'Euro'){
        valor2 = valor / 6.58;
        valor3 = valor2.toStringAsFixed(2);
      }else if(dropdownValor== 'Dolar' && dropdownValor1== 'Real'){
        valor2 = valor * 5.68;
        valor3 = valor2.toStringAsFixed(2);
      }else if(dropdownValor== 'Dolar' && dropdownValor1== 'Euro'){
        valor2 = valor / 1.16;
        valor3 = valor2.toStringAsFixed(2);
      }else if(dropdownValor== 'Euro' && dropdownValor1== 'Real'){
        valor2 = valor * 6.58;
        valor3 = valor2.toStringAsFixed(2);
      }else if(dropdownValor== 'Euro' && dropdownValor1== 'Dolar'){
        valor2 = valor * 1.16;
        valor3 = valor2.toStringAsFixed(2);
      }
    });
  }
 
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
      title: Text("Abertura de Conta"),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }
 
  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
           Container(
            height: 400,
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 40, bottom: 40),
            color: Colors.white,
            child: Column(
              children: <Widget>[
          _campo("Valor", valorController),
          Row(
            children: [
            _texto('De'),
            _texto('  '),
            _dropdown1(),
            ],
          ),
          Row(
            children: [
            _texto('Para'),
            _texto('  '),
            _dropdown2()
            ]
          ),
            
          _botao(),
          _texto('Resultado'),
          _texto(valor3)
        ],
      ),
    )
        ]
      ));
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
          onPressed: _botaoDados,
          child: Text("Converter",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.black,
        ),
      ),
    );
  }
  _dropdown1() {
    return DropdownButton<String>(
      value: dropdownValor,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black,fontSize: 25.0),
      underline: Container(
        height: 0.5,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValor = newValue!;
        });
      },
      items: <String>['','Real', 'Dolar', 'Euro']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

   _dropdown2() {
    return DropdownButton<String>(
      value: dropdownValor1,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black,fontSize: 25.0),
      underline: Container(
        height: 0.5,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValor1 = newValue!;
        });
      },
      items: <String>['','Dolar', 'Euro', 'Real']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }

_texto1(textoParaExibir) {
    return Text(
      textoParaExibir,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }
}