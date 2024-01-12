import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print('MAP PAGE EXIBIDA');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'),
      ),
      body: Center(
        child: Text(
          'Conteúdo da Map Page',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}