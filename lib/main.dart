import 'package:bloc_login_page/repository/auth/login/login_repository.dart';
import 'package:bloc_login_page/views/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Login',
      home: RepositoryProvider(
        create: (context) => LoginRepository(),
        child:  LoginScreen()),
    );
  }
}
