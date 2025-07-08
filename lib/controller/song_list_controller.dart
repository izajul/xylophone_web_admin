import 'package:appwrite/models.dart';
import 'package:get/get.dart';

import '../appWrite/appwrite_service.dart';

class SongListController extends GetxController {
  /// todo: this will be changed to a Song model class, for now it's just a Document list
  final songs = <Document>[].obs;

  final isLoading = false.obs;

  final _db = AppwriteService().databases;

  @override
  onInit() {
    super.onInit();
    _fetchSongs();
  }

  Future<void> _fetchSongs() async {
    isLoading.value = true;
    try {
      final res = await _db.listDocuments(
        databaseId: "6869ddcd00119b997f40",
        collectionId: "6869ddec0035cabcc194",
      );
      songs(res.documents);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
