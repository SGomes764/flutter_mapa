import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, dynamic>> usersData = [];

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print('PROFILE PAGE EXIBIDA');
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/SGomes764/database/main/flutter_mapa/data.json')); // repositorio GitHub publico

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        usersData = List<Map<String, dynamic>>.from(data);
      });
    } else {
      print('Erro ao carregar dados: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final user in usersData)
              Column(
                children: [
                  CircleAvatar(
                  radius: 95.0,
                  backgroundImage: CachedNetworkImageProvider(user["img"]),
              ),
              SizedBox(height: 100.0,),
              Text(
                'Nome: ${user["nome"]}\nSobrenome: ${user["sobrenome"]}\nUser: ${user["user"]}\nEmail: ${user["email"]}\nID: ${user["id"]}',
                style: const TextStyle(
                  fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

