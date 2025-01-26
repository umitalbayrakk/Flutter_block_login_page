
import 'package:bloc_login_page/blocs/auth/login/login_bloc.dart';
import 'package:bloc_login_page/blocs/auth/login/login_event.dart';
import 'package:bloc_login_page/blocs/auth/login/login_state.dart';
import 'package:bloc_login_page/views/auth/form_submission_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.formKey});


final dynamic formKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ?  Center(child: CircularProgressIndicator())
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
             if(formKey.currentState!.validate()){
               // context.read<LoginBloc>().add(LoginSubmitted());
             }
              },
              child: const Text("Login", style: TextStyle(color: Colors.white)),
            );
    });
  }
}
