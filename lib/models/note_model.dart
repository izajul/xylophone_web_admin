import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/helper_func.dart';

sealed class BaseNoteModel {}

/// single note
class SingleNoteModel extends BaseNoteModel {
  final NoteDataModel noteData;

  SingleNoteModel({required this.noteData});
}

/// beam note containing multiple notes but connected by a line
class BeamNoteModel extends BaseNoteModel {
  final List<NoteDataModel> notes;

  /// this one might depends on the notes type, for sixteenth there will be double beam
  final bool hasDoubleBeam;

  BeamNoteModel({required this.notes, this.hasDoubleBeam = false})
    : assert(notes.length > 1 && _checkNoteTypes(notes));

  static bool _checkNoteTypes(List<NoteDataModel> notes) {
    for (final e in notes) {
      if (e.noteType != NoteType.eighth && e.noteType != NoteType.sixteenth) {
        return false;
      }
    }
    return true;
  }

  double get topOffsetFirst => _getTopOffset(notes.first.note!);

  double get topOffsetLast => _getTopOffset(notes.last.note!);

  double _getTopOffset(KeyTones note) {
    switch (note) {
      case KeyTones.c:
        return 39.0;
      case KeyTones.d:
        return 34.0;
      case KeyTones.e:
        return 29.0;
      case KeyTones.f:
        return 23.0;
      case KeyTones.g:
        return 18.0;
      case KeyTones.a:
        return 14.0;
      case KeyTones.h:
        return 9.0;
      default:
        return 10;
    }
  }
}

/// also known as ghost/silence note
/// for now we are using only quarter ghost note
class SilentNoteModel extends BaseNoteModel {
  final NoteType noteType;

  SilentNoteModel({this.noteType = NoteType.quarter});
}

/// note with dot, simply show a dot '.' after a not, which means add extra 0.5 duration
// class DoteNoteModel extends NoteModel {}

/// note to show repeat note symbol
class RepeatNoteModel extends BaseNoteModel {
  final bool showRightHand;

  RepeatNoteModel({this.showRightHand = false});
}

/// note to show vertical divider on staff
class DivisionNoteModel extends BaseNoteModel {}

class NoteDataModel {
  KeyTones? note; // e.g., 'C', 'D', 'E'
  // final int position; // vertical position index (0 = bottom line)
  final double offsetX; // horizontal scroll position

  final bool noteDivider;

  // final bool showPause, onlyDivider, noteDivider;

  final NoteType noteType;

  /// note with dot, simply show a dot '.' after a not, which means add extra 0.5 duration
  final int dotNumber;

  Color get noteColor =>
      HelperFunctions.noteColorMap[note?.nameUpper] ?? Colors.black;

  bool get isStemUP {
    switch (note) {
      case KeyTones.h:
      case KeyTones.c2:
        return false;
      default:
        return true;
    }
  }

  int get position {
    switch (note) {
      case KeyTones.c:
        return 6;
      case KeyTones.d:
        return 5;
      case KeyTones.e:
        return 4;
      case KeyTones.f:
        return 3;
      case KeyTones.g:
        return 2;
      case KeyTones.a:
        return 1;
      case KeyTones.h:
        return 0;
      case KeyTones.c2:
        return 1;

      default:
        return 0;
    }
  }

  EdgeInsets get padding {
    double top = 0.0;
    double bottom = 0.0;

    switch (note) {
      case KeyTones.c:
        return EdgeInsets.only(left: 10, bottom: 0, top: 28);
      case KeyTones.d:
        return EdgeInsets.only(left: 10, bottom: 0, top: 16);
      case KeyTones.e:
        return EdgeInsets.only(left: 10, bottom: 0, top: 3);
      case KeyTones.f:
        return EdgeInsets.only(left: 10, bottom: 7, top: 0);
      case KeyTones.g:
        return EdgeInsets.only(left: 10, bottom: 18, top: 0);
      case KeyTones.a:
        return EdgeInsets.only(left: 10, bottom: 29, top: 0);
      case KeyTones.h:
        return EdgeInsets.only(left: 10, bottom: 0, top: 16);
      case KeyTones.c2:
        return EdgeInsets.only(left: 10, bottom: 0, top: 5);
      default:
        return EdgeInsets.only(left: 10, bottom: 0, top: 0);
    }

    if (isStemUP) {
      top = (7.0 * position).abs();
    } else {
      bottom = (35.0 * position).abs();
    }

    return EdgeInsets.only(left: 10, bottom: bottom, top: top);
  }

  NoteDataModel({
    required this.note,
    required this.offsetX,
    this.noteType = NoteType.quarter,
    this.noteDivider = false,
    this.dotNumber = 0,
  });

  NoteDataModel get copy => NoteDataModel(
    note: note,
    offsetX: offsetX,
    noteType: noteType,
    noteDivider: noteDivider,
    dotNumber: dotNumber,
  );
}
