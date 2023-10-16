class AuthRepository {
  Future<bool> registerUser({
    required String name,
    required String phoneNumber,
    required String email,
    required String country,
    required String lifeHistory,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}
