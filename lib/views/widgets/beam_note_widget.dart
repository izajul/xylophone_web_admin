import 'package:flutter/material.dart';
import '../../models/note_model.dart';
import '../../utils/assets.dart';
import 'note_custom_paints.dart';

class BeamNoteWidget extends StatelessWidget {
  final BeamNoteModel beamNoteModel;

  const BeamNoteWidget({super.key, required this.beamNoteModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 0),
      child: Stack(
        children: [
          Row(
            children: List.generate(beamNoteModel.notes.length, (idx) {
              final data = beamNoteModel.notes[idx];
              return Padding(
                padding: data.padding.copyWith(right: 10),
                child: Center(
                  child: getNoteTopStemAllPainter(
                    30,
                    color: data.noteColor,
                    noteType: NoteType.quarter,
                  ),
                ),
              );
            }),
          ),
          Positioned(
            left: 27,
            child: CustomPaint(
              size: Size((beamNoteModel.notes.length - 1) * 50 + 10, 90),

              /// 2 = 60, 3 = 110, 4 = 160, 5 = 210, 6 = 260,
              painter: BeamPainter(
                beamNoteModel.topOffsetFirst,
                beamNoteModel.topOffsetLast,
                isDoubleBeam: beamNoteModel.hasDoubleBeam
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BeamPainter extends CustomPainter {
  final double s_padding, e_padding;
  final bool isDoubleBeam;

  BeamPainter(this.s_padding, this.e_padding, {this.isDoubleBeam = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    canvas.drawLine(
      Offset(0, s_padding),
      Offset(size.width - 9, e_padding),
      paint,
    );
    if (isDoubleBeam) {
      canvas.drawLine(
        Offset(0, s_padding + 15),
        Offset(size.width - 9, e_padding + 15),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
