import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xylophone_web/views/widgets/staff_with_notes.dart';

import '../../controller/add_song_controller.dart';
import '../../models/note_model.dart';
import '../../utils/assets.dart';
import 'note_widget.dart';

class AddSongPageTwo extends StatelessWidget {
  AddSongPageTwo({super.key});

  final addSongController = Get.put(AddSongController());

  final List<BaseNoteModel> notes1 = [
    SingleNoteModel(
      noteData: NoteDataModel(note: KeyTones.c, offsetX: 0, noteDivider: true),
    ),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.c, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.d, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.e, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.f, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.g, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.h, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.c2, offsetX: 0)),
    RepeatNoteModel(),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.c,
        offsetX: 0,
        noteType: NoteType.eighth,
        noteDivider: true,
      ),
    ),

    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.c,
        offsetX: 0,
        noteType: NoteType.eighth,
      ),
    ),

    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.d,
        offsetX: 0,
        noteType: NoteType.eighth,
      ),
    ),

    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.e,
        offsetX: 0,
        noteType: NoteType.eighth,
      ),
    ),

    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.f,
        offsetX: 0,
        noteType: NoteType.eighth,
      ),
    ),

    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.g,
        offsetX: 0,
        noteType: NoteType.eighth,
      ),
    ),

    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.a,
        offsetX: 0,
        noteType: NoteType.eighth,
      ),
    ),

   /* SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.h,
        offsetX: 0,
        noteType: NoteType.eighth,
      ),
    ),

    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.c2,
        offsetX: 0,
        noteType: NoteType.eighth,
      ),
    ),*/

    // DivisionNoteModel(),
  ];

  final List<BaseNoteModel> notes2 = [
    /// whole notes list
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.c,
        offsetX: 0,
        noteType: NoteType.whole,
        noteDivider: true,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.c,
        offsetX: 0,
        noteType: NoteType.whole,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.d,
        offsetX: 0,
        noteType: NoteType.whole,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.e,
        offsetX: 0,
        noteType: NoteType.whole,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.f,
        offsetX: 0,
        noteType: NoteType.whole,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.g,
        offsetX: 0,
        noteType: NoteType.whole,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.h,
        offsetX: 0,
        noteType: NoteType.whole,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.c2,
        offsetX: 0,
        noteType: NoteType.whole,
      ),
    ),

    RepeatNoteModel(
      showRightHand: true,
    ),

    /// half notes list
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.d,
        offsetX: 0,
        noteType: NoteType.half,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.e,
        offsetX: 0,
        noteType: NoteType.half,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.f,
        offsetX: 0,
        noteType: NoteType.half,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.g,
        offsetX: 0,
        noteType: NoteType.half,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.a,
        offsetX: 0,
        noteType: NoteType.half,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.h,
        offsetX: 0,
        noteType: NoteType.half,
      ),
    ),
    SingleNoteModel(
      noteData: NoteDataModel(
        note: KeyTones.c2,
        offsetX: 0,
        noteType: NoteType.half,
      ),
    ),
  ];

  final List<BaseNoteModel> notes3 = [
    BeamNoteModel(
      notes: [
        NoteDataModel(note: KeyTones.c, offsetX: 0, noteType: NoteType.eighth),
        NoteDataModel(note: KeyTones.g, offsetX: 0, noteType: NoteType.eighth),
      ],
    ),
    SilentNoteModel(),
    BeamNoteModel(
      hasDoubleBeam: true,
      notes: [
        NoteDataModel(
          note: KeyTones.c,
          offsetX: 0,
          noteType: NoteType.sixteenth,
        ),
        NoteDataModel(
          note: KeyTones.g,
          offsetX: 0,
          noteType: NoteType.sixteenth,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Drag The Notes Below *",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),

          /// Available Notes
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var note in notes1)
                  Draggable<BaseNoteModel>(
                    data: note,
                    feedback: NoteWidget(note: note),
                    child: NoteWidget(note: note),
                    onDragCompleted: () {
                      print("Completed");
                    },
                  ),
              ],
            ),
          ),

          /// Available Notes
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var note in notes2)
                  Draggable<BaseNoteModel>(
                    data: note,
                    feedback: NoteWidget(note: note),
                    child: NoteWidget(note: note),
                    onDragCompleted: () {
                      print("Completed");
                    },
                  ),
              ],
            ),
          ),

          /// Available Notes
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (var note in notes3)
                  Draggable<BaseNoteModel>(
                    data: note,
                    feedback: NoteWidget(note: note),
                    child: NoteWidget(note: note),
                    onDragCompleted: () {
                      print("Completed");
                    },
                  ),
              ],
            ),
          ),

          SizedBox(height: 24),

          Text(
            "Drag and Drop Notes Below",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),

          /// Staff with notes
          StaffWithNotesDragNDrop(),

          SizedBox(height: 16),

          Text(
            "Enter Song Lyrics. *",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Must each lyrics Separated by Comma \",\"",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 12),

          /// Lyrics input form field
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Po,ka,pa,la,na,la,si,...",
            ),

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value';
              }

              return null;
            },
            onChanged: (value) {
              addSongController.lyrics.value = value
                  .split(",")
                  .map((e) => e.trim())
                  .toList();
            },
          ),
          /*   DragTarget<BaseNoteModel>(
            onAcceptWithDetails: (details) {
              print("onAcceptWithDetails: ${details.data}");
              */
          /* setState(() {
                widget.notes.add(details.data);
              });*/
          /*
            },
            onWillAcceptWithDetails: (details) {
              print("onWillAcceptWithDetails: ${details.data}");
              return true;
            },
            builder:
                (
                  BuildContext context,
                  List<BaseNoteModel?> candidateData,
                  List<dynamic> rejectedData,
                ) {
                  print("builder");

                  return Container(
                    width: double.infinity,
                    height: 56,
                    color: Colors.blue,
                  );
                },
          ),*/
        ],
      ),
    );
  }
}
