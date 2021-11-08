import 'package:flutter/material.dart';
import 'package:app12/pessoal.dart';
import 'package:app12/formacao.dart';
import 'package:app12/experiencia.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int _currentPage = 0;
 
  final telas = [
    Center(child: Text('Tela Home')),
    Pessoal(),
    Experiencia(),
    Formacao(),
  ];
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: telas[_currentPage],
        drawer: Drawer(
            child: ListView(
          children: [
             UserAccountsDrawerHeader(
              accountName: Text('Richard Jovino'),
              accountEmail: Text('richard.jovino@fatec.sp.com.br'),
              currentAccountPicture: CircleAvatar(
                //backgroundImage: AssetImage('assets/images/rock2.jpg'),
                backgroundColor: Colors.purple,
                backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/C4E03AQHSzy2nltoysQ/profile-displayphoto-shrink_100_100/0/1538668153903?e=1641427200&v=beta&t=qmVIGY8Ansx7DK8_kMC8OTEi2mIisMfuZ3N1s4EgNqc'),
              ),
             ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Home'),
              subtitle: Text('Tela inicial do App'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Pessoal'),
              subtitle: Text('Tela Pessoal do App'),
              trailing: Icon(Icons.account_box_outlined),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Experiencia'),
              subtitle: Text('Tela de Experiencia do App'),
              trailing: Icon(Icons.contact_mail_rounded),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),ListTile(
              //leading: Icon(Icons.star),
              title: Text('Formacao'),
              subtitle: Text('Tela de Formacao do App'),
              trailing: Icon(Icons.contact_mail_rounded),
              onTap: () {
                setState(() {
                  _currentPage = 3;
                });
              },
            )
          ],
        )),
      ),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("App Meu Perfil"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
  _body() {
    if (_currentPage == 0){
      return Center(child: Text("Tela Home"));
    } else if (_currentPage == 1){
      return Pessoal();
    } else if (_currentPage == 2){
      return Experiencia();
    } else {
      return Formacao();
    }
  }
}
