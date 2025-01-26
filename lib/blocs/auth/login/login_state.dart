import 'package:bloc_login_page/views/auth/form_submission_status.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final  FormSubmissionStatus formStatus;

  const LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitalFormStatus(),
  });

  LoginState copyWrite({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object> get props => [];
  
}