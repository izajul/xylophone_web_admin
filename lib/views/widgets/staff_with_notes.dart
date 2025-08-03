import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xylophone_web/views/widgets/dialogs/beam_note_modifier_dialog.dart';

import '../../controller/add_song_controller.dart';
import '../../models/note_model.dart';
import 'note_widget.dart';

class StaffWithNotesDragNDrop extends StatefulWidget {
  const StaffWithNotesDragNDrop({super.key});

  @override
  State<StaffWithNotesDragNDrop> createState() =>
      _StaffWithNotesDragNDropState();
}

class _StaffWithNotesDragNDropState extends State<StaffWithNotesDragNDrop> {
  final List<BaseNoteModel> notes = [];

  final ScrollController _noteController = ScrollController();
  final ScrollController _lyricsController = ScrollController();

  bool _isSyncing = false;

  final addSongController = Get.put(AddSongController());

  @override
  void initState() {
    super.initState();
    // notes.addAll(widget.notes);
    _noteController.addListener(() {
      if (_isSyncing) return;
      _isSyncing = true;
      _lyricsController.jumpTo(_noteController.offset);
      _isSyncing = false;
    });

    _lyricsController.addListener(() {
      if (_isSyncing) return;
      _isSyncing = true;
      _noteController.jumpTo(_lyricsController.offset);
      _isSyncing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 90,
          child: Stack(
            children: [
              /// Fixed horizontal divider for the Staff
              Align(
                alignment: Alignment.center,
                child: Container(
                  // alignment: Alignment.bottomCenter
                  // color: Colors.blue,
                  height: 65,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(color: Colors.black54, height: 11),
                      Divider(color: Colors.black54, height: 11),
                      Divider(color: Colors.black54, height: 11),
                      Divider(color: Colors.black54, height: 11),
                      Divider(color: Colors.black54, height: 11),
                    ],
                  ),
                ),
              ),

              // Fixed vertical divider for the Clef
              Positioned(
                top: 0,
                bottom: 0,
                child: VerticalDivider(
                  width: 1,
                  color: Colors.black,
                  endIndent: 28,
                  indent: 18,
                ),
              ),

              // Fixed Treble Clef
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  'assets/images/png/icon_treble_clef_musical_note.png',
                  // height: 100,
                  width: 50,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: 0,
                bottom: 0,
                left: 50,
                right: 0,
                child: DragTarget<BaseNoteModel>(
                  onAcceptWithDetails: (details) async {
                    print(details.data);

                    final data = details.data;

                    if (data is BeamNoteModel) {
                      final nNote = await BeamNoteModifierDialog.show(
                        context,
                        data,
                      );
                      setState(() {
                        notes.add(nNote);
                      });
                    } else {
                      setState(() {
                        notes.add(data);
                      });
                    }
                    // _scrollController.jumpTo(_scrollController.offset);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _noteController.animateTo(
                        _noteController.position.maxScrollExtent,
                        duration: 100.milliseconds,
                        curve: Curves.easeIn,
                      );
                    });
                  },
                  onWillAcceptWithDetails: (details) {
                    print(details.data);
                    return true;
                  },
                  builder:
                      (
                        BuildContext context,
                        List<BaseNoteModel?> candidateData,
                        List<dynamic> rejectedData,
                      ) {
                        return ReorderableListView(
                          scrollController: _noteController,
                          // padding: EdgeInsets.only(right: 1000),
                          // physics: NeverScrollableScrollPhysics(),
                          physics: const ClampingScrollPhysics(),
                          buildDefaultDragHandles: false,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          onReorder: (int oldIndex, int newIndex) {
                            setState(() {
                              if (newIndex > oldIndex) {
                                newIndex -= 1;
                              }
                              final BaseNoteModel item = notes.removeAt(
                                oldIndex,
                              );
                              notes.insert(newIndex, item);
                            });
                          },
                          proxyDecorator:
                              (
                                Widget child,
                                int index,
                                Animation<double> animation,
                              ) {
                                return GestureDetector(
                                  onLongPress: () {
                                    print("long press");
                                  },
                                  child: child,
                                );
                              },
                          children: [
                            for (var i = 0; i < notes.length; i++)
                              ReorderableDragStartListener(
                                key: Key("$i"),
                                index: i,
                                child: Material(
                                  color: Colors.transparent,
                                  child: PopupMenuButton(
                                    child: NoteWidget(note: notes[i]),
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: Text("Delete"),
                                          onTap: () {
                                            setState(() {
                                              notes.removeAt(i);
                                            });
                                          },
                                        ),
                                      ];
                                    },
                                  ),
                                ),
                              ),
                            /* ReorderableDragStartListener(
                                key: Key("$i"),
                                index: i,
                                child: GestureDetector(
                                  onLongPress: (){
                                    print("long press");
                                  },
                                    child: NoteWidget(note: notes[i])),
                              ),*/
                          ],
                        );
                      },
                ),
              ),
            ],
          ),
        ),

        /// song lyrics
        SizedBox(
          height: 20,
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Obx(() {
              final lyrics = addSongController.lyrics.value;
              var lyricsIdx = 0;
              return ListView(
                physics: const ClampingScrollPhysics(),
                controller: _lyricsController,
                scrollDirection: Axis.horizontal,
                // itemCount: 0,
                // itemCount: notes.length,
                children: [
                  ...List.generate(notes.length, (idx) {
                    print("notes size ${notes.length}, idx $idx, lyricsIdx $lyricsIdx");
                    // if (lyricsIdx > lyrics.length - 1) {
                    //   // text = ;
                    //   return SizedBox(width: 46, child: Text("-"),);
                    // }

                    final item = notes[idx];

                    if (item is BeamNoteModel) {
                      return Row(
                        children: [
                          ...List.generate(item.notes.length, (idx) {
                            if (lyricsIdx > lyrics.length - 1) {
                              // text = ;
                              return SizedBox(width: 46, child: Text("--"),);
                            }

                            final text = lyrics[lyricsIdx];
                            lyricsIdx++;

                            return Padding(
                              padding: const EdgeInsets.only(right: 2, left: 2),
                              child: SizedBox(
                                width: 46,
                                child: Center(child: Text("$text")),
                              ),
                            );
                          }),
                        ],
                      );
                    }

                    if (item is SingleNoteModel && lyricsIdx <lyrics.length) {
                      var text = lyrics[lyricsIdx];

                      lyricsIdx++;
                      return Padding(
                        padding: const EdgeInsets.only(right: 2, left: 2),
                        child: SizedBox(
                          width: 46,
                          child: Center(child: Text("$text")),
                        ),
                      );
                    }
                    return SizedBox(width: 46, child: Text("---"),);
                  }),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
