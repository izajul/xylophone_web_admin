
//Add this CustomPaint widget to the Widget Tree
import 'package:flutter/material.dart';
import '../../utils/assets.dart';

Widget getNoteTopStemAllPainter(
    double width, {
      Color color = Colors.black,
      NoteType noteType = NoteType.quarter,
      bool showDivider = false,
    }) => CustomPaint(
  size: Size(width, (width * 1.3423100250804596).toDouble()),
  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
  // painter: _RPSCustomPainter(noteType, color, showDivider: showDivider),
  painter: RPSCustomPainter(
    noteType,
    color,
    showDivider: showDivider,
  ),
);

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final NoteType noteType;
  final Color color;
  final bool showDivider;

  RPSCustomPainter(this.noteType, this.color, {this.showDivider = false});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5642147, size.height * 0.04269766);
    path_0.cubicTo(
      size.width * 0.5783997,
      size.height * 0.04269766,
      size.width * 0.5925846,
      size.height * 0.04269766,
      size.width * 0.6071957,
      size.height * 0.04269766,
    );
    path_0.cubicTo(
      size.width * 0.6116518,
      size.height * 0.04601529,
      size.width * 0.6104934,
      size.height * 0.05084315,
      size.width * 0.6110070,
      size.height * 0.05529446,
    );
    path_0.cubicTo(
      size.width * 0.6136462,
      size.height * 0.07828990,
      size.width * 0.6191732,
      size.height * 0.1002371,
      size.width * 0.6334619,
      size.height * 0.1209611,
    );
    path_0.cubicTo(
      size.width * 0.6344045,
      size.height * 0.1224286,
      size.width * 0.6353498,
      size.height * 0.1238920,
      size.width * 0.6363251,
      size.height * 0.1254022,
    );
    path_0.cubicTo(
      size.width * 0.6587309,
      size.height * 0.1583587,
      size.width * 0.6970264,
      size.height * 0.1850157,
      size.width * 0.7341417,
      size.height * 0.2088579,
    );
    path_0.cubicTo(
      size.width * 0.7405566,
      size.height * 0.2129957,
      size.width * 0.7467666,
      size.height * 0.2172842,
      size.width * 0.7529957,
      size.height * 0.2215788,
    );
    path_0.cubicTo(
      size.width * 0.7606155,
      size.height * 0.2268199,
      size.width * 0.7682680,
      size.height * 0.2319998,
      size.width * 0.7762757,
      size.height * 0.2369193,
    );
    path_0.cubicTo(
      size.width * 0.7836742,
      size.height * 0.2415782,
      size.width * 0.7898815,
      size.height * 0.2467724,
      size.width * 0.7961325,
      size.height * 0.2522801,
    );
    path_0.cubicTo(
      size.width * 0.7991951,
      size.height * 0.2549383,
      size.width * 0.8023589,
      size.height * 0.2575313,
      size.width * 0.8055909,
      size.height * 0.2600755,
    );
    path_0.cubicTo(
      size.width * 0.8213769,
      size.height * 0.2725421,
      size.width * 0.8338461,
      size.height * 0.2861219,
      size.width * 0.8459655,
      size.height * 0.3006218,
    );
    path_0.cubicTo(
      size.width * 0.8468261,
      size.height * 0.3016497,
      size.width * 0.8476840,
      size.height * 0.3026755,
      size.width * 0.8485692,
      size.height * 0.3037359,
    );
    path_0.cubicTo(
      size.width * 0.8992902,
      size.height * 0.3652565,
      size.width * 0.9144997,
      size.height * 0.4332149,
      size.width * 0.8924272,
      size.height * 0.5034876,
    );
    path_0.cubicTo(
      size.width * 0.8800591,
      size.height * 0.5401504,
      size.width * 0.8586424,
      size.height * 0.5798256,
      size.width * 0.8244750,
      size.height * 0.6083511,
    );
    path_0.cubicTo(
      size.width * 0.8192540,
      size.height * 0.6099081,
      size.width * 0.8192540,
      size.height * 0.6099081,
      size.width * 0.8149264,
      size.height * 0.6101300,
    );
    path_0.cubicTo(
      size.width * 0.8141369,
      size.height * 0.6095438,
      size.width * 0.8133500,
      size.height * 0.6089556,
      size.width * 0.8125386,
      size.height * 0.6083511,
    );
    path_0.cubicTo(
      size.width * 0.8135003,
      size.height * 0.5988439,
      size.width * 0.8172542,
      size.height * 0.5911747,
      size.width * 0.8226883,
      size.height * 0.5826690,
    );
    path_0.cubicTo(
      size.width * 0.8570523,
      size.height * 0.5263589,
      size.width * 0.8643934,
      size.height * 0.4629901,
      size.width * 0.8357366,
      size.height * 0.4044574,
    );
    path_0.cubicTo(
      size.width * 0.8204316,
      size.height * 0.3747413,
      size.width * 0.7979220,
      size.height * 0.3494357,
      size.width * 0.7671725,
      size.height * 0.3273033,
    );
    path_0.cubicTo(
      size.width * 0.7552333,
      size.height * 0.3184067,
      size.width * 0.7552333,
      size.height * 0.3184067,
      size.width * 0.7516816,
      size.height * 0.3154494,
    );
    path_0.cubicTo(
      size.width * 0.7366142,
      size.height * 0.3033532,
      size.width * 0.7185033,
      size.height * 0.2944262,
      size.width * 0.7002612,
      size.height * 0.2852182,
    );
    path_0.cubicTo(
      size.width * 0.6963762,
      size.height * 0.2832521,
      size.width * 0.6925185,
      size.height * 0.2812615,
      size.width * 0.6886663,
      size.height * 0.2792608,
    );
    path_0.cubicTo(
      size.width * 0.6635148,
      size.height * 0.2666497,
      size.width * 0.6349864,
      size.height * 0.2578936,
      size.width * 0.6071957,
      size.height * 0.2490358,
    );
    path_0.cubicTo(
      size.width * 0.6072012,
      size.height * 0.2506905,
      size.width * 0.6072012,
      size.height * 0.2506905,
      size.width * 0.6072121,
      size.height * 0.2523819,
    );
    path_0.cubicTo(
      size.width * 0.6074225,
      size.height * 0.3178551,
      size.width * 0.5630126,
      size.height * 0.3687736,
      size.width * 0.5642147,
      size.height * 0.04269766,
    );
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.black;

    /// drawing note flag
    if (noteType == NoteType.eighth || noteType == NoteType.sixteenth) {
      canvas.drawPath(path_0, paint_0_fill);
    }

    Paint paint_2_stroke =
    Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_2_stroke.color = Color.fromRGBO(0, 0, 0, 1.0).withOpacity(1.0);

    /// drawing note stem
    if (noteType != NoteType.half) {
      canvas.drawLine(
        Offset(size.width * 0.5800608, size.height * 0.04236997),
        Offset(size.width * 0.5811754, size.height * 0.8303044),
        paint_2_stroke,
      );
    }
    Path path_3 = Path();
    path_3.moveTo(size.width * 0.2704264, size.height * 0.7808086);
    path_3.cubicTo(
      size.width * 0.2704264,
      size.height * 0.7808086,
      size.width * 0.3447853,
      size.height * 0.7597651,
      size.width * 0.4483829,
      size.height * 0.7654275,
    );
    path_3.cubicTo(
      size.width * 0.5519777,
      size.height * 0.7710878,
      size.width * 0.6501221,
      size.height * 0.8410531,
      size.width * 0.5182967,
      size.height * 0.9198478,
    );
    path_3.cubicTo(
      size.width * 0.3864740,
      size.height * 0.9986404,
      size.width * 0.2045669,
      size.height * 0.9952637,
      size.width * 0.1419286,
      size.height * 0.9803609,
    );
    path_3.cubicTo(
      size.width * 0.07929032,
      size.height * 0.9654580,
      size.width * 0.02980149,
      size.height * 0.9163877,
      size.width * 0.09430034,
      size.height * 0.8612988,
    );
    path_3.cubicTo(
      size.width * 0.1587965,
      size.height * 0.8062078,
      size.width * 0.2656097,
      size.height * 0.7810875,
      size.width * 0.2704264,
      size.height * 0.7808086,
    );
    path_3.close();

    Paint paint_3_stroke =
    Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    paint_3_stroke.color = color;

    /// drawing note head stroke
    canvas.drawPath(path_3, paint_3_stroke);

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = color;
    /// drawing note head filled
    if (noteType != NoteType.whole && noteType != NoteType.half) {
      canvas.drawPath(path_3, paint_3_fill);
    }

    Paint paint_1_stroke =
    Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    paint_1_stroke.color = Colors.black;

    /// drawing note note divider
    if (showDivider) {
      canvas.drawLine(
        Offset(size.width * -0.04490714, size.height * 0.8879151),
        Offset(size.width * 0.6764320, size.height * 0.8865636),
        paint_1_stroke,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}