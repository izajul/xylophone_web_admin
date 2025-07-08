
import 'package:get/get.dart';
import 'package:xylophone_web/appWrite/appwrite_service.dart';

class DatabaseRepo{

  static final DatabaseRepo _instance = DatabaseRepo._internal();

  factory DatabaseRepo() => _instance;

  DatabaseRepo._internal() {
    // _initAppWrite();
  }

  final _db = AppwriteService().databases;
  final _storage = AppwriteService().storage;

  Future<void> createDocument() async {

  }

  Future<void> updateDocument() async {

  }

  Future<void> deleteDocument() async {

  }

  Future<void> getDocument() async {

  }

  Future<void> getDocuments() async {

  }

  Future<void> uploadFile() async {

  }

  Future<void> downloadFile() async {

  }

  Future<void> deleteFile() async {

  }

  Future<void> getFile() async {

  }

  Future<void> getFiles() async {

  }

}