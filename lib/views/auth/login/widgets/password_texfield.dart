import 'package:bloc_login_page/blocs/auth/login/login_bloc.dart';
import 'package:bloc_login_page/blocs/auth/login/login_event.dart';
import 'package:bloc_login_page/blocs/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTexfield extends StatelessWidget {
  const PasswordTexfield({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
          icon: Icon(Icons.key),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        validator: (value) => state.isValidPassword ? null : 'Password is too short',
        onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(password: value, username: '')),
      );
    }
    );
  }
}
