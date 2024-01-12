import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print('PROFILE PAGE EXIBIDA');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Text(
          'Conteúdo da Profile Page',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

