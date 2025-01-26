
class LoginRepository {
  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email == '2' && password == '2') {
      return;
    } else {
      throw Exception('Email or password is incorrect');
    }
  }
  
}