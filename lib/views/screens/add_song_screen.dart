import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xylophone_web/views/widgets/add_song_page_one.dart';
import 'package:xylophone_web/views/widgets/add_song_page_two.dart';

import '../../controller/add_song_controller.dart' show AddSongController;
import '../widgets/add_song_page_three.dart';

class AddSongScreen extends StatelessWidget {
  AddSongScreen({super.key});

  final _addSongController = Get.put(AddSongController());
  final _pageController = PageController();

  _nextPage() {
    final current = _addSongController.formPageNumber;
    if (current < 2) {
      _addSongController.formPageNumber(
        _addSongController.formPageNumber.value + 1,
      );
    }
    _gotoPage(_addSongController.formPageNumber.value);
  }

  _prevPage() {
    final current = _addSongController.formPageNumber;
    if (current > 0) {
      _addSongController.formPageNumber(
        _addSongController.formPageNumber.value - 1,
      );
    }
    _gotoPage(_addSongController.formPageNumber.value);
  }

  _gotoPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInSine,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Song"), centerTitle: true),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 860, minWidth: 320),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                /// first step of adding a new song
                Flexible(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      AddSongPageOne(),
                      AddSongPageTwo(),
                      AddSongPageThree(),
                    ],
                  ),
                ),

                SizedBox(height: 36),

                /// page navigation controller buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      if (_addSongController.formPageNumber.value == 0) {
                        return SizedBox.shrink();
                      }
                      return FilledButton(
                        onPressed: () {
                          _prevPage();
                        },
                        child: Text("Previous"),
                      );
                    }),
                    Obx(() {
                      final is1 = _addSongController.isPageOneFilled.value;
                      final is2 = _addSongController.isPageTwoFilled.value;
                      final is3 = _addSongController.isPageThreeFilled.value;

                      final idx = _addSongController.formPageNumber.value;

                      if (idx == 2) {
                        return FilledButton(
                          onPressed: !is3
                              ? null
                              : () {
                                  _nextPage();
                                },
                          child: Text("Submit"),
                        );
                      }
                      return FilledButton(
                        onPressed: (idx == 0 && !is1) || (idx == 1 && !is2)
                            ? null
                            : () {
                                _nextPage();
                              },
                        child: Text("Next"),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
