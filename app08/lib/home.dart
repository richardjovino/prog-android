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
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Anuncios"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  _corpo() {
    return Container(
      child: PageView(
        children: <Widget>[
          Container(
              height: 200,
              padding: const EdgeInsets.all(8.0),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              color: Colors.white,
              child: Row(children: <Widget>[
                Column(
                  children: [_foto('img1.jpg'), _texto('Estilo Musical'),_texto('Sertanejo')],
                ),
                Column(
                    children: [_foto('img2.jpg'), _texto('Estilo Musical'),_texto('Rock')]),
                Column(
                    children: [_foto('img3.jpg'), _texto('Estilo Musical'),_texto('Eletronica')]),
                
              ])),
              Row(
                children: [
                 Column(
                    children: [_foto('img4.jpg'), _texto('Estilo Musical'),_texto('Pagode')]),
                Column(
                    children: [_foto('img5.jpg'), _texto('Estilo Musical'),_texto('Funk')]),
                ],
              )
             
        ],
      ),
    );
  }

  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 500,
      width: 500,
      fit: BoxFit.fill,
      //fit: BoxFit.contain,
      //fit: BoxFit.cover,
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
