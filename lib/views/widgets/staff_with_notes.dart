import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../models/note_model.dart';
import 'note_widget.dart';

class StaffWithNotesDragNDrop extends StatefulWidget {
  const StaffWithNotesDragNDrop({super.key, required this.notes});

  final List<BaseNoteModel> notes;

  @override
  State<StaffWithNotesDragNDrop> createState() =>
      _StaffWithNotesDragNDropState();
}

class _StaffWithNotesDragNDropState extends State<StaffWithNotesDragNDrop> {
  final List<BaseNoteModel> notes = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              onAcceptWithDetails: (details) {
                print(details.data);
                setState(() {
                  notes.add(details.data);
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
                      // padding: EdgeInsets.only(right: 1000),
                      // physics: NeverScrollableScrollPhysics(),
                      buildDefaultDragHandles: false,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) {
                            newIndex -= 1;
                          }
                          final BaseNoteModel item = notes.removeAt(oldIndex);
                          notes.insert(newIndex, item);
                        });
                      },
                     proxyDecorator: (Widget child, int index, Animation<double> animation){
                        return GestureDetector(
                          onLongPress: (){
                            print("long press");
                          },
                          child:child,
                        );
                     },
                      children: [
                        for (var i = 0; i < notes.length; i++)
                          ReorderableDragStartListener(
                            key: Key("$i"),
                            index: i,
                            child: NoteWidget(note: notes[i]),
                          ),
                      ],
                    );
                  },
            ),
          ),
        ],
      ),
    );
  }
}
