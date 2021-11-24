import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valorController = TextEditingController();
  String info_login = '';
  String dropdownValor = '';
  String dropdownValor1 = '';

  _converteValor() async {
    if (dropdownValor == 'Real' && dropdownValor1 == 'Dolar') {
      String url = 'https://economia.awesomeapi.com.br/json/last/BRL-USD';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      print(retorno);

      double valor = double.parse(valorController.text);
      String conversor = retorno["BRLUSD"]["ask"];
      double conta = valor * double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido dolares';
      });
    } else if (dropdownValor == 'Real' && dropdownValor1 == 'Euro') {
      String url = 'https://economia.awesomeapi.com.br/json/last/BRL-EUR';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["BRLEUR"]["ask"];
      double conta = valor * double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido euros';
      });
    } else if (dropdownValor == 'Real' && dropdownValor1 == 'Bitcoin') {
      String url = 'https://economia.awesomeapi.com.br/json/last/BTC-BRL';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["BTCBRL"]["ask"];
      double conta = valor / double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido bitcoins';
      });
    } else if (dropdownValor == 'Dolar' && dropdownValor1 == 'Real') {
      String url = 'https://economia.awesomeapi.com.br/json/last/USD-BRL';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["USDBRL"]["ask"];
      double conta = valor * double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido reais';
      });
    } else if (dropdownValor == 'Dolar' && dropdownValor1 == 'Euro') {
      String url = 'https://economia.awesomeapi.com.br/json/last/USD-EUR';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["USDEUR"]["ask"];
      double conta = valor * double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido euros';
      });
    } else if (dropdownValor == 'Dolar' && dropdownValor1 == 'Bitcoin') {
      String url = 'https://economia.awesomeapi.com.br/json/last/BTC-USD';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["BTCUSD"]["ask"];
      double conta = valor / double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido bitcoins';
      });
    }
     else if (dropdownValor == 'Euro' && dropdownValor1 == 'Real') {
      String url = 'https://economia.awesomeapi.com.br/json/last/EUR-BRL';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["EURBRL"]["ask"];
      double conta = valor * double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido reais';
      });
    } else if (dropdownValor == 'Euro' && dropdownValor1 == 'Dolar') {
      String url = 'https://economia.awesomeapi.com.br/json/last/EUR-USD';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["EURUSD"]["ask"];
      double conta = valor * double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido dolares';
      });

    } else if (dropdownValor == 'Euro' && dropdownValor1 == 'Bitcoin') {
      String url = 'https://economia.awesomeapi.com.br/json/last/BTC-EUR';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["BTCEUR"]["ask"];
      double conta = valor / double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido bitcoins';
      });
    } else if (dropdownValor == 'Bitcoin' && dropdownValor1 == 'Real') {
      String url = 'https://economia.awesomeapi.com.br/json/last/BTC-BRL';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["BTCBRL"]["ask"];
      double conta = valor * double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido reais';
      });
    } else if (dropdownValor == 'Bitcoin' && dropdownValor1 == 'Dolar') {
      String url = 'https://economia.awesomeapi.com.br/json/last/BTC-USD';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["BTCUSD"]["ask"];
      double conta = valor * double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido dolares';
      });
    } else if (dropdownValor == 'Bitcoin' && dropdownValor1 == 'Euro') {
      String url = 'https://economia.awesomeapi.com.br/json/last/BTC-EUR';

      print(url);

      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> retorno = json.decode(response.body);
      double valor = double.parse(valorController.text);
      String conversor = retorno["BTCEUR"]["ask"];
      double conta = valor * double.parse(conversor);
      String convertido = conta.toStringAsFixed(2);

      setState(() {
        info_login = 'O valor convertido ficou: $convertido euros';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
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
            Row(children: [_texto('Para'), _texto('  '), _dropdown2()]),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _converteValor,
                  child: Text("Valor Convertido",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.purple,
                ),
              ),
            ),
            _texto(info_login),
          ],
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
      style: const TextStyle(color: Colors.black, fontSize: 25.0),
      underline: Container(
        height: 0.5,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValor = newValue!;
        });
      },
      items: <String>['', 'Real', 'Dolar', 'Euro', 'Bitcoin'].map<DropdownMenuItem<String>>((String value) {
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
      style: const TextStyle(color: Colors.black, fontSize: 25.0),
      underline: Container(
        height: 0.5,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValor1 = newValue!;
        });
      },
      items: <String>['', 'Real', 'Dolar', 'Euro', 'Bitcoin']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }
}
