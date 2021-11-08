import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
 String infoname = "";
 String infoidade = "";
 String dropdownValor = 'Escolha seu Sexo';
 String dropdownValor1 = 'Escolha sua Escolaridade';
 String drop = '';
 String drop1 = '';
 double valorSlider = 20;
 String valor1 = '';
 bool valorSwitch = false;
 String valor2 = '';
 String dados = '';
 
  void _botaoDados() {
    setState(() {
      String name = nameController.text;
      String idade = idadeController.text;
      
      infoname = 'Nome: ' + name;
      infoidade = 'Idade: ' + idade;
      drop = 'Sexo: ' +dropdownValor;
      drop1 ='Escolaridade: ' + dropdownValor1;
      dados = 'Dados Informados';
      valor1 = 'Limite: $valorSlider';
      if(valorSwitch== true){
        valor2 = 'Brasileiro: Sim';
      }else{
        valor2 = 'Brasileiro: Nao';
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
      title: Text("Abertura de Conta"),
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
          _campo("Nome", nameController),
          _campo("Idade", idadeController),
          _dropdownSexo(),
          _dropdownEscola(),
          _texto1('Limite'),
          _slider(),
          Row(
            children: [
            _texto1('Brasileiro:'),
          _switch()
            ]
          ),
          _botao(),
          _texto(dados),
          _texto1(infoname),
          _texto1(infoidade),
          _texto1(drop),
          _texto1(drop1),
          _texto1(valor1),
          _texto1(valor2)

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
          onPressed: _botaoDados,
          child: Text("Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.black,
        ),
      ),
    );
  }
  _dropdownSexo() {
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
      items: <String>['Escolha seu Sexo','Masculino', 'Feminino']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

   _dropdownEscola() {
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
      items: <String>['Escolha sua Escolaridade','Fundamental', 'Médio', 'Superior']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _slider() {
    return Slider(
      value: valorSlider,
      min: 0,
      max: 1000,
      divisions: 100,
      label: valorSlider.round().toString(),
      onChanged: (double value) {
        setState(() {
          valorSlider = value;
        });
      },
    );
  }
  _switch() {
    return Switch(
      value: valorSwitch,
      onChanged: (value) {
        setState(() {
          valorSwitch = value;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.blue,
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