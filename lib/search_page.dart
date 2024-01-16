import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('SEARCH PAGE EXIBIDA');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Search Page',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text(
          'Conteúdo da Search Page',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
