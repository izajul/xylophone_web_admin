import 'package:appwrite/appwrite.dart';

// single tone class for Apprite
class AppwriteService {
  static final AppwriteService _instance = AppwriteService._internal();

  factory AppwriteService() => _instance;

  AppwriteService._internal() {
    _initAppWrite();
  }

  Client client = Client();
  late final Account account;
  late final Databases databases;
  late final Storage storage;

  void _initAppWrite() {
    client
        .setEndpoint(
          'https://syd.cloud.appwrite.io/v1',
        ) // or your self-hosted endpoint
        .setProject('686491a3003b4afd3dfb') // Project ID from console
        .setSelfSigned(status: true); // Only for self-hosted without SSL

    account = Account(client);
    databases = Databases(client);
    storage = Storage(client);
  }
}
