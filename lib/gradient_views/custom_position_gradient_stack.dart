import 'package:flutter/material.dart';

class CustomPositionGradientStack extends StatelessWidget {
  const CustomPositionGradientStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const lineargradient = LinearGradient(
        colors: [
          Colors.black,
          Colors.white,
        ],
        stops: [
          0.0,
          1.0
        ],
        begin: FractionalOffset.topRight,
        end: FractionalOffset.bottomLeft,
        tileMode: TileMode.clamp);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(size.width * .1),
        height: size.height * .5,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: lineargradient,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            )),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      // color: Colors.white,
                      height: size.height * 0.15,
                      width: size.width * 0.15,
                      image: const NetworkImage('https://picsum.photos/200'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Toucan',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Donate to your favourite charity monthly',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
            Positioned(
              bottom: -100,
              left: 20,
              child: Container(
                height: size.height * .22,
                width: size.width * .44,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.grey, BlendMode.saturation),
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://picsum.photos/200/400',
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    )),
              ),
            ),
            Positioned(
              bottom: -80,
              right: 20,
              child: Opacity(
                opacity: 0.6,
                child: CustomShape(
                    strokeWidth: 4,
                    radius: 100,
                    gradient: lineargradient,
                    onPressed: () {},
                    height: size.height * .22,
                    width: size.width * .44,
                    child: const SizedBox()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShape extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final double height;
  final double width;

  CustomShape({
    Key? key,
    required this.height,
    required this.width,
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    required Widget child,
    required VoidCallback onPressed,
  })  : _painter = _GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        _child = child,
        _callback = onPressed,
        _radius = radius,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          // borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            // constraints: BoxConstraints(minWidth: 88, minHeight: 48),
            height: height,
            width: width,
            child: _child,
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient})
      : strokeWidth = strokeWidth,
        radius = radius,
        gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndCorners(
      outerRect,
      bottomLeft: Radius.circular(radius),
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndCorners(
      innerRect,
      bottomLeft: Radius.circular(radius - strokeWidth),
      topLeft: Radius.circular(radius - strokeWidth),
      topRight: Radius.circular(radius - strokeWidth),
    );

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
