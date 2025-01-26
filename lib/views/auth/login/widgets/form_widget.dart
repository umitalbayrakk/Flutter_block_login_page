

import 'package:bloc_login_page/views/auth/login/widgets/login_button.dart';
import 'package:bloc_login_page/views/auth/login/widgets/password_texfield.dart';
import 'package:bloc_login_page/views/auth/login/widgets/username_textfield.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
   FormWidget({super.key});
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: const Column(
          children: [
            UsernameTextfield(),
            SizedBox(height: 30),
            PasswordTexfield(),
            SizedBox(height: 30),
            LoginButton(),
          ],
        ),
      );
  }
}