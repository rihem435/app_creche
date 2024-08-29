import 'package:creche/core/storage/storage.dart';

class AppStorage {
  static const String keyUserName = "username";
  static const String keId = "id";
  static const String keyEmail = "email";

  static saveUserName(String username) {
    SecureStorage.writeSecureData(key: keyUserName, value: username);
  }

  static String? readUserName() {
    return SecureStorage.readSecureData(keyUserName);
  }

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: keyUserName, value: email);
  }

  static String? readEmail() {
    return SecureStorage.readSecureData(keyEmail);
  }

  static saveId(String id) {
    SecureStorage.writeSecureData(key: keId, value: id);
  }

  static String? readId() {
    return SecureStorage.readSecureData(keId);
  }
}
