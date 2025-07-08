import 'package:get/get.dart';

import '../appWrite/databaseController.dart';

class AddSongController extends GetxController {
  final DatabaseRepo _db = DatabaseRepo();
  final isLoading = false.obs;
  final formPageNumber = 0.obs;

  final isPageOneFilled = true.obs;
  final isPageTwoFilled = true.obs;
  final isPageThreeFilled = true.obs;

  Future<void> addSong() async {
    isLoading.value = true;
    await _db.createDocument();
    isLoading.value = false;
  }
}
