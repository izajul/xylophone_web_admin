import 'package:flutter/material.dart';
import '../../utils/assets.dart';


//Add this CustomPaint widget to the Widget Tree
Widget getNoteBottomStemPainter(
  double width, {
  Color color = Colors.black,
  NoteType noteType = NoteType.quarter,
}) => CustomPaint(
  size: Size(width, (width * 1.3423100250804596).toDouble()),
  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
  painter: RPSCustomPainter(noteType, color),
);

//Copy this CustomPainter code to the Bottom of the File
class _RPSCustomPainter extends CustomPainter {
  final NoteType noteType;
  final Color color;

  _RPSCustomPainter(this.noteType, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5616875, size.height * 0.02285092);
    path_0.cubicTo(
      size.width * 0.5779161,
      size.height * 0.02285092,
      size.width * 0.5941446,
      size.height * 0.02285092,
      size.width * 0.6108649,
      size.height * 0.02285092,
    );
    path_0.cubicTo(
      size.width * 0.6159739,
      size.height * 0.02665703,
      size.width * 0.6113294,
      size.height * 0.4126212,
      size.width * 0.6114387,
      size.height * 0.4875426,
    );
    path_0.cubicTo(
      size.width * 0.6114387,
      size.height * 0.4965592,
      size.width * 0.6114660,
      size.height * 0.5055555,
      size.width * 0.6114660,
      size.height * 0.5145721,
    );
    path_0.cubicTo(
      size.width * 0.6114933,
      size.height * 0.5163632,
      size.width * 0.6114933,
      size.height * 0.5181543,
      size.width * 0.6114933,
      size.height * 0.5200065,
    );
    path_0.cubicTo(
      size.width * 0.6115206,
      size.height * 0.5489900,
      size.width * 0.6116299,
      size.height * 0.5779734,
      size.width * 0.6117119,
      size.height * 0.6069568,
    );
    path_0.cubicTo(
      size.width * 0.6118211,
      size.height * 0.6367341,
      size.width * 0.6118758,
      size.height * 0.6665032,
      size.width * 0.6119031,
      size.height * 0.6962743,
    );
    path_0.cubicTo(
      size.width * 0.6119304,
      size.height * 0.7146250,
      size.width * 0.6119578,
      size.height * 0.7329758,
      size.width * 0.6120670,
      size.height * 0.7513286,
    );
    path_0.cubicTo(
      size.width * 0.6121217,
      size.height * 0.7639335,
      size.width * 0.6121217,
      size.height * 0.7765405,
      size.width * 0.6121217,
      size.height * 0.7891455,
    );
    path_0.cubicTo(
      size.width * 0.6121217,
      size.height * 0.7964056,
      size.width * 0.6122337,
      size.height * 0.8656117,
      size.width * 0.6122883,
      size.height * 0.8728718,
    );
    path_0.cubicTo(
      size.width * 0.6127255,
      size.height * 0.9282639,
      size.width * 0.5444236,
      size.height * 0.8097270,
      size.width * 0.5655698,
      size.height * 0.8197592,
    );
    path_0.cubicTo(
      size.width * 0.5669359,
      size.height * 0.4540427,
      size.width * 0.5603215,
      size.height * 0.3959720,
      size.width * 0.5616875,
      size.height * 0.02285092,
    );
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.black;

    /// drawing stem line
    if (noteType != NoteType.whole) {
      canvas.drawPath(path_0, paint_0_fill);
    }

    Paint paint_1_stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
    paint_1_stroke.color = color;

    /// drawing note stock head
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(size.width * 0.2614078, size.height * 0.9087449),
        width: size.width * 0.5451749,
        height: size.height * 0.2126538,
      ),
      paint_1_stroke,
    );

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = color;

    /// drawing note filed head
    if (noteType != NoteType.whole || noteType != NoteType.half) {
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(size.width * 0.2614078, size.height * 0.9087449),
          width: size.width * 0.5451749,
          height: size.height * 0.2126538,
        ),
        paint_1_fill,
      );
    }

    Paint paint_2_stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
    paint_2_stroke.color = Color.fromRGBO(0, 0, 0, 1.0).withOpacity(1.0);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * -0.03009655,
        size.height * 0.8863010,
        size.width * 0.7044057,
        size.height * 0.01766280,
      ),
      paint_2_stroke,
    );

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * -0.03009655,
        size.height * 0.8863010,
        size.width * 0.7044057,
        size.height * 0.01766280,
      ),
      paint_2_fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final NoteType noteType;
  final Color color;

  RPSCustomPainter(this.noteType, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
    paint_0_stroke.color = Colors.black;

    /// drawing stem line
    if (noteType != NoteType.whole) {
      canvas.drawLine(
        Offset(size.width * 0.3538421, size.height * 0.2084365),
        Offset(size.width * 0.3549568, size.height * 0.9963710),
        paint_0_stroke,
      );
    }

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5573955, size.height * 0.07141650);
    path_1.cubicTo(
      size.width * 0.5573955,
      size.height * 0.07141650,
      size.width * 0.6317544,
      size.height * 0.05037298,
      size.width * 0.7353520,
      size.height * 0.05603533,
    );
    path_1.cubicTo(
      size.width * 0.8389468,
      size.height * 0.06169565,
      size.width * 0.9370912,
      size.height * 0.1316610,
      size.width * 0.8052658,
      size.height * 0.2104556,
    );
    path_1.cubicTo(
      size.width * 0.6734431,
      size.height * 0.2892482,
      size.width * 0.4915360,
      size.height * 0.2858716,
      size.width * 0.4288977,
      size.height * 0.2709687,
    );
    path_1.cubicTo(
      size.width * 0.3662594,
      size.height * 0.2560659,
      size.width * 0.3167706,
      size.height * 0.2069955,
      size.width * 0.3812694,
      size.height * 0.1519066,
    );
    path_1.cubicTo(
      size.width * 0.4457656,
      size.height * 0.09681569,
      size.width * 0.5525788,
      size.height * 0.07169535,
      size.width * 0.5573955,
      size.height * 0.07141650,
    );
    path_1.close();

    Paint paint_1_stroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
    paint_1_stroke.color = color;

    /// drawing note stock head
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = color;

    /// drawing note filed head
    if (noteType != NoteType.whole && noteType != NoteType.half) {
      canvas.drawPath(path_1, paint_1_fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
