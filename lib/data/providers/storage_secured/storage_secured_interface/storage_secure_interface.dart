// This is a local authentication data source interface
// secure storage interface:

abstract class StorageSecInterface {
  Future<void> persistEmailAndToken(String email, String token);

  // Future<bool> hasToken();
  /*Future<bool> hasToken() async {
    String? value = await _storage.read(key: _tokenKey);
    return value != null;
  }*/

  Future<void> deleteToken();

  Future<void> deleteEmail();

  Future<String?> getEmail();

  Future<String?> getToken();
}
