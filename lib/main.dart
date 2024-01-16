import 'package:flutter/material.dart';
import 'map_page.dart';
import 'profile_page.dart';
import 'search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Mapas',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        centerTitle: true,
        title: const Text(
          'Home Page',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
      body: const Center(
        child: Text(
          'Conteúdo da Home Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // BOTÃO MAPA
            IconButton(
              icon: const Icon(Icons.map, color: Colors.black, size: 30,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
            ),
            // BOTÃO PESQUISAR
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black, size: 30,),
              onPressed: () {
                // Substituir a tela atual pela Search Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
            ),
            // BOTÃO PERFIL
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black, size: 30,),
              onPressed: () {
                // Substituir a tela atual pela Profile Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
