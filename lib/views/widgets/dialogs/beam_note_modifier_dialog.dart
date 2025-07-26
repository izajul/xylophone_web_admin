import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xylophone_web/models/note_model.dart';

import '../../../utils/assets.dart';

class BeamNoteModifierDialog extends StatelessWidget {
  BeamNoteModifierDialog({super.key, required this.note}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notes.addAll(note.notes.map((e)=>e.copy));
    });
  }

  final BeamNoteModel note;

  final notes = <NoteDataModel>[].obs;

  static Future<BeamNoteModel> show(
    BuildContext context,
    BeamNoteModel note,
  ) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BeamNoteModifierDialog(note: note);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Modify the Note"),
                IconButton(
                  onPressed: () {
                    notes.add(NoteDataModel(note: KeyTones.g, offsetX: 0,noteType: NoteType.eighth),);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 14),
            Flexible(
              fit: FlexFit.tight,
              child: Obx(() {
                final ls = this.notes;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: ls.length,
                  itemBuilder: (context, index) {
                    final note = ls[index];
                    return DropdownButton<KeyTones>(
                      value: note.note,
                      onChanged: (value) {
                        if (value == null) return;
                        notes[index].note = value;
                        notes.refresh();
                      },
                      items: KeyTones.values.map((e) {
                        return DropdownMenuItem<KeyTones>(
                          value: e,
                          child: Text(e.nameUpper),
                        );
                      }).toList(),
                    );
                  },
                );
              }),
            ),

            /// bottom done options
            TextButton(
              onPressed: () {
                // Get.back(result: BeamNoteModel(notes: notes));
                Navigator.pop(
                  context,
                  BeamNoteModel(hasDoubleBeam: note.hasDoubleBeam, notes: notes),
                );
              },
              child: Text("Done"),
            ),
          ],
        ),
      ),
    );
  }
}
