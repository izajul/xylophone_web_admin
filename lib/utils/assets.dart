enum KeyTones {
  a("a"),
  c("c"),
  d("d"),
  e("e"),
  f("f"),
  g("g"),
  c2("c2"),
  h("h");

  final String _name;

  String get nameUpper => _name.toUpperCase();

  String get path => "assets/tones/$_name.wav";

  const KeyTones(this._name);
}

enum NoteType {
  whole("whole"), // ○ = 4 beat
  half("half"), // ◯ + stem = 2 beat
  quarter("quarter"), // ● + stem = 1 beat
  eighth("eighth"), // ● + stem + 1 Flag = 1/2 beat
  sixteenth("sixteenth") // ● + stem + 2 Flag = 1/4 beat
  ;

  final String _name;

  String get name => _name.toUpperCase();

  const NoteType(this._name);
}

enum AudioSrc {
  only_piano("only_piano"),
  only_singing("only_singing");

  final String _name;

  String get path => "audios/$_name.mp3";

  const AudioSrc(this._name);
}
