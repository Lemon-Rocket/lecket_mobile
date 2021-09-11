class UtilsBlocAuth {
  Map<String, dynamic> bodyLogin(String email, String password) {
    return {
      "email": email,
      "password": password,
    };
  }
}
