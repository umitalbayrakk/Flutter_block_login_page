import 'package:bloc_login_page/blocs/auth/login/login_bloc.dart';
import 'package:bloc_login_page/blocs/auth/login/login_state.dart';
import 'package:bloc_login_page/repository/auth/login/login_repository.dart';
import 'package:bloc_login_page/views/auth/login/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../form_submission_status.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => LoginBloc(authRepository: context.read<LoginRepository>()),
          child: BlocListener<LoginBloc, LoginState>(
            listenWhen: (previous, current) => previous.formStatus != current.formStatus,
            listener: (BuildContext context, LoginState state) {
              final formStatus = state.formStatus;

              if (formStatus is SubmissionFailed) {
               _showSnackBar(context, formStatus.exception.toString());
              }
            },
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network('https://logos-world.net/wp-content/uploads/2020/10/Free-Emblem.png',
                      height: 300, width: 300),
                  FormWidget(),
                ],
              ),
            )),
          )),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
