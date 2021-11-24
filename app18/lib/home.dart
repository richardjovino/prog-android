import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController loginController = TextEditingController();
  String info_login = '';
 
  _recuperarLogin() async {
    String url = 'https://api.github.com/users/${loginController.text}';
 
    print(url);
 
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    int id = retorno["id"];
    String nome = retorno["name"];
    String repositorios = retorno["repos_url"];
    String createdIn = retorno["created_at"];
    int seguidores = retorno["followers"];
    int seguindo = retorno["following"];
 
    setState(() {
      info_login =
          'Id: $id \n Nome: $nome \n Repositorios: $repositorios \n Criado em: $createdIn \n Seguidores: $seguidores \n Seguindo: $seguindo';
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil dos Devs"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite seu login Git",
                  labelStyle: TextStyle(color: Colors.purple)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.purple, fontSize: 25.0),
              controller: loginController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _recuperarLogin,
                  child: Text("Obter dados",
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
  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }
}
 
