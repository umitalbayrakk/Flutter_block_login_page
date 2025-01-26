import 'package:bloc_login_page/blocs/auth/login/login_bloc.dart';
import 'package:bloc_login_page/blocs/auth/login/login_event.dart';
import 'package:bloc_login_page/blocs/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsernameTextfield extends StatelessWidget {
  const UsernameTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            labelText: 'Username',
            icon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          validator: (value) => state.isValidUsername ? null : 'User name is too short',
          onChanged: (value) => context.read<LoginBloc>().add(LoginUsernameChanged(username: value)),
        );
      },
    );
  }
}
