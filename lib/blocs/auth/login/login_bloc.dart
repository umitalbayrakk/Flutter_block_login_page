import 'package:bloc_login_page/blocs/auth/login/login_event.dart';
import 'package:bloc_login_page/blocs/auth/login/login_state.dart';
import 'package:bloc_login_page/repository/auth/login/login_repository.dart';
import 'package:bloc_login_page/views/auth/form_submission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository authRepository;

  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<LoginUsernameChanged>((event, emit) {
      emit(state.copyWrite(username: event.username));
    });
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWrite(password: event.password));
    });
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWrite(formStatus: FormSubmitting()));
      try {
        await authRepository.login(event.username, event.password);
        emit(state.copyWrite(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWrite(formStatus: SubmissionFailed(Exception(e.toString()))));
      }
    });
  }
}
