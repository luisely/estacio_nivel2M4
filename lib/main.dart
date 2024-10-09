// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Widget titleSection(String city, String country, String likes) {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  city,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Text(
                country,
                style: TextStyle(color: Colors.grey[500], fontSize: 18),
              ),
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text(likes),
      ],
    ),
  );
}

Widget textSection(String text) {
  return Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      text,
      softWrap: true,
      style: TextStyle(fontSize: 18),
    ),
  );
}

Column _buildButtonColumn(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: Colors.blue),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ),
        ),
      ),
    ],
  );
}

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(Icons.call, 'CALL'),
    _buildButtonColumn(Icons.near_me, 'ROUTE'),
    _buildButtonColumn(Icons.share, 'SHARE'),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo de Viagem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        '/page1': (context) => DestinationFlorianopolis(),
        '/page2': (context) => DestinationParis(),
        '/page3': (context) => DestinationAmsterda(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seja Bem-vindo!'),
      ),
      drawer: Container(
        width: 200,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 120,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Text(
                    'Menu',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Florianópolis'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/page1');
                },
              ),
              ListTile(
                title: Text('Paris'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/page2');
                },
              ),
              ListTile(
                title: Text('Amsterdã'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/page3');
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logotipo na parte superior
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'images/logo.png',
              height: 200,
              width: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'A Ely Viagens é uma agência especializada em criar experiências de viagem personalizadas, oferecendo pacotes nacionais e internacionais com total comodidade e segurança.\n\n'
              'Com um atendimento dedicado, nossa missão é transformar seus sonhos de viagem em realidade, cuidando de todos os detalhes para que sua aventura seja inesquecível.\n',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Explore o mundo com a Ely Viagens e descubra destinos incríveis!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.public),
                    SizedBox(width: 10),
                    Text(
                      'elyviagens.com.br',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationFlorianopolis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Image.asset(
          'images/floripa.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection('Florianópolis', 'Brasil', '1890'),
        buttonSection,
        textSection(
            'Florianópolis é famosa por suas águas cristalinas e ondas perfeitas para o surf.\nO local oferece uma combinação de natureza preservada e ambiente tranquilo.')
      ]),
    );
  }
}

class DestinationParis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Image.asset(
          'images/paris.png',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection('Paris', 'França', '989'),
        buttonSection,
        textSection(
            'Paris encanta com seus monumentos icônicos, como a Torre Eiffel e o Museu do Louvre, além de sua rica história, arte e arquitetura.\nA cidade também é famosa por suas charmosas ruas, cafés e culinária refinada.')
      ]),
    );
  }
}

class DestinationAmsterda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Image.asset(
          'images/amsterda.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection('Amsterdã', 'Países Baixos', '2190'),
        buttonSection,
        textSection(
            'Amsterdã encanta com seus canais pitorescos, museus renomados como o Rijksmuseum e a Casa de Anne Frank, além de uma rica cultura e vida noturna vibrante.\nA cidade também é famosa por suas bicicletas, cafés aconchegantes e arquitetura histórica, oferecendo uma experiência única e charmosa.')
      ]),
    );
  }
}
