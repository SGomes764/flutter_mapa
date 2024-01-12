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
      title: 'Flutter Barra com Ícones',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo da Home Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                // navegar para a Map Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // navegar para a Search Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // navegar para a Profile Page
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

