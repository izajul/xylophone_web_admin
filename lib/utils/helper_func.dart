import 'package:flutter/material.dart';

import 'assets.dart';

class HelperFunctions {
  // Map to store note names and their corresponding colors
  static const Map<String, Color> noteColorMap = {
    'C': Colors.blueAccent,
    'D': Colors.green,
    'E': Colors.yellow,
    'F': Colors.orangeAccent,
    'G': Colors.red,
    'A': Colors.purple,
    'H': Colors.white,
    'C2': Colors.blue, // High C
  };

  /// Returns a list of asset paths for a given list of notes.
  static List<KeyTones> getNoteAssets(List<String> notes) {
    return notes.map((note) => getAssetPathForNote(note)).toList();
  }

  /// Retrieves the asset path for a specific note.
  /// Defaults to C4 if the note is unrecognized.
  static KeyTones getAssetPathForNote(String note) {
    switch (note) {
      case 'C':
        return KeyTones.c;
      case 'D':
        return KeyTones.d;
      case 'E':
        return KeyTones.e;
      case 'F':
        return KeyTones.f;
      case 'G':
        return KeyTones.g;
      case 'A':
        return KeyTones.a;
      case 'H':
        return KeyTones.h;
      case 'C2':
        return KeyTones.c2;
      default:
        return KeyTones.a;
    }
  }

  /// Returns a width multiplier based on the note for visual key representation.

  static double getWidthMultiplierForKey(String note) {
    switch (note) {
      case 'C':
        return 1.0;
      case 'D':
        return 0.9;
      case 'E':
        return 0.8;
      case 'F':
        return 0.7;
      case 'G':
        return 0.6;
      case 'A':
        return 0.5;
      case 'H':
        return 0.4;
      case 'C2':
        return 0.3;
      default:
        return 1.0;
    }
  }
}
