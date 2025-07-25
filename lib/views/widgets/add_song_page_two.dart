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

  final List<BaseNoteModel> notes = [
    SingleNoteModel(
      noteData: NoteDataModel(note: KeyTones.c, offsetX: 0, noteDivider: true),
    ),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.d, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.e, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.f, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.g, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.h, offsetX: 0)),
    SingleNoteModel(noteData: NoteDataModel(note: KeyTones.c2, offsetX: 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            "Drag The Notes Below",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),

          Wrap(
            children: [
              for (var note in notes)
                Draggable<BaseNoteModel>(
                  data: note,
                  feedback: SizedBox(
                    width: 56,
                    height: 56,
                    child: NoteWidget(note: note),
                  ),
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: NoteWidget(note: note),
                  ),
                  onDragCompleted: () {
                    print("Completed");
                  },
                ),
            ],
          ),

          SizedBox(height: 24),

          Text(
            "Drag and Drop Notes Below",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),
          StaffWithNotesDragNDrop(),


          SizedBox(height: 16),

          Text(
            "Enter Song Lyrics. *",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Must each lyrics Separated by Comma \",\"",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 12),

          /// song name input form field
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
              addSongController.lyrics.value = value.split(",").map((e) => e.trim()).toList();
            },
          ),
       /*   DragTarget<BaseNoteModel>(
            onAcceptWithDetails: (details) {
              print("onAcceptWithDetails: ${details.data}");
              *//* setState(() {
                widget.notes.add(details.data);
              });*//*
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
