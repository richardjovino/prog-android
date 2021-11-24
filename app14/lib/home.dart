import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

 
class _HomeState extends State<Home> {
  bool valorSwitch = true;
  bool valorSwitch2 = true;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Frases"),
        ),
          body: _corpo(),
    );
  }
   _corpo() {
     if (valorSwitch == true && valorSwitch2 == true) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children:<Widget>[
            Row(children: [
          _texto2('Dia'),
          _switch(),
          _texto2('Pequeno'),
          _switch2(),
            ],),
          Container(
            color: Colors.white,
            child:Column(
              children: <Widget>[
                 _texto('A vingança não é plena, mata a alma e a envenena')
              ]
            )
          )
          ]
        )     
        )   
        );
    } else if(valorSwitch == true && valorSwitch2 == false){  
      return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children:<Widget>[
            Row(children: [
          _texto2('Dia'),
          _switch(),
          _texto2('Pequeno'),
          _switch2(),
            ],),
          Container(
            color: Colors.white,
            child:Column(
              children: <Widget>[
                 _texto1('A vingança não é plena, mata a alma e a envenena')
              ]
            )
          )
          ]
        )     
        )   
        );

    }else if (valorSwitch == false && valorSwitch2 == true){
      return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children:<Widget>[
            Row(children: [
          _texto2('Dia'),
          _switch(),
          _texto2('Pequeno'),
          _switch2(),
            ],),
          Container(
            color: Colors.black26,
            child:Column(
              children: <Widget>[
                 _texto('A vingança não é plena, mata a alma e a envenena')
              ]
            )
          )
          ]
        )     
        )   
        );
    } 
    else {
         return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Container(
        child: Column(
          children:<Widget>[
            Row(children: [
          _texto2('Dia'),
          _switch(),
          _texto2('Pequeno'),
          _switch2(),
            ],),
          Container(
            color: Colors.black26,
            child:Column(
              children: <Widget>[
                 _texto1('A vingança não é plena, mata a alma e a envenena')
              ]
            )
          )
          ]
        )     
        )   
        );
    }
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
  _switch2() {
    return Switch(
      value: valorSwitch2,
      onChanged: (value) {
        setState(() {
          valorSwitch2 = value;
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
      style: TextStyle(color: Colors.black, fontSize: 10.0),
    );
  }
  _texto1(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 40.0),
    );
  }
  _texto2(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }
}
