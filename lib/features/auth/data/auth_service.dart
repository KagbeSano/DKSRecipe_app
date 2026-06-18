class AuthService {
  Future<bool> signUp(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  Future<bool> signIn(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  Future<void> signOut() async {}

  bool isLoggedIn() {
    return true;
  }
}