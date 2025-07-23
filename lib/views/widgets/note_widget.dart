import 'package:flutter/material.dart';
import '../../models/note_model.dart';
import 'beam_note_widget.dart';
import 'ic_note_bottom_stem.dart';
import 'note_custom_paints.dart';

class NoteWidget extends StatelessWidget {
  final BaseNoteModel note;

  const NoteWidget({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    /// silent note
    if (note is SilentNoteModel) {
      return Padding(
        padding: const EdgeInsets.only(right: 5, bottom: 10),
        child: Image.asset("assets/images/png/pause_sign.png", width: 25),
      );
    }

    /// divider note
    if (note is DivisionNoteModel) {
      return VerticalDivider(
        width: 1,
        color: Colors.black,
        endIndent: 28,
        indent: 18,
      );
    }

    /// repeat note
    if (note is RepeatNoteModel) {
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child:
            !(note as RepeatNoteModel).showRightHand
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        ":",
                        style: TextStyle(fontSize: 36, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 5),
                    VerticalDivider(
                      width: 1,
                      color: Colors.black,
                      endIndent: 28,
                      indent: 18,
                    ),
                    SizedBox(width: 4),
                    VerticalDivider(
                      width: 4,
                      color: Colors.black,
                      thickness: 4,
                      endIndent: 28,
                      indent: 18,
                    ),
                  ],
                )
                : Row(
                  children: [
                    VerticalDivider(
                      thickness: 4,
                      width: 4,
                      color: Colors.black,
                      endIndent: 28,
                      indent: 18,
                    ),
                    SizedBox(width: 4),
                    VerticalDivider(
                      width: 1,
                      color: Colors.black,
                      endIndent: 28,
                      indent: 18,
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        ":",
                        style: TextStyle(fontSize: 36, color: Colors.black),
                      ),
                    ),
                  ],
                ),
      );
    }

    /// beam note
    if (note is BeamNoteModel) {
      final data = note as BeamNoteModel;

      return BeamNoteWidget(beamNoteModel: data);
    }

    final data = (note as SingleNoteModel).noteData;

    return Padding(
      padding: data.padding.copyWith(right: 10),
      // padding: EdgeInsets.only(left: 10,top: 0, bottom: 0.0),
      // child: CustomPaint(
      //   size: Size(20, 40),
      //   painter:
      //       !note.isEighthNote
      //           ? MusicNotePainter(
      //             noteColor: note.noteColor,
      //             stemUp: note.isStemUP,
      //           )
      //           : EighthNotePainter(),
      // ),

      // child: Center(child: getEighthNoteSolidPainter(30, color: note.noteColor)),
      child: Center(
        child:
            data.isStemUP
                ? getNoteTopStemAllPainter(
                  30,
                  color: data.noteColor,
                  noteType: data.noteType,
                  showDivider: data.noteDivider,
                )
                : getNoteBottomStemPainter(
                  30,
                  color: data.noteColor,
                  noteType: data.noteType,
                ),
      ),
    );
  }
}

/// Custom painter for drawing a music note with a stem.
class MusicNotePainter extends CustomPainter {
  final Color noteColor;
  final bool stemUp; // true = stem goes up, false = down

  MusicNotePainter({required this.noteColor, required this.stemUp});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = noteColor
          ..style = PaintingStyle.fill;

    final ovalWidth = size.width;
    final ovalHeight = size.width * 0.6;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw stem
    final stemPaint =
        Paint()
          ..color = Colors.black
          ..strokeWidth = 2;

    // final stemHeight = size.height * 0.5;
    final stemHeight = 40;

    if (stemUp) {
      canvas.drawLine(
        Offset(centerX + ovalWidth / 2, centerY),
        Offset(centerX + ovalWidth / 2, centerY - stemHeight),
        stemPaint,
      );
    } else {
      canvas.drawLine(
        Offset(centerX - ovalWidth / 2, centerY),
        Offset(centerX - ovalWidth / 2, centerY + stemHeight),
        stemPaint,
      );
    }

    // Draw note head (ellipse)
    final ovalRect = Rect.fromCenter(
      center: Offset(centerX, centerY),
      width: ovalWidth,
      height: ovalHeight,
    );
    canvas.drawOval(ovalRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
