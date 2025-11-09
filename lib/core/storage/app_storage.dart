import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future<void> writeData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    try {
      return await storage.read(key: key);
    } catch (e) {
      return null;
    }
  }

}