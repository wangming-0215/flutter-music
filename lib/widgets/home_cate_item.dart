import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  final double size;
  final String image;
  final Widget extraChild;
  final Widget title;

  const HomeCategoryItem({
    this.size = 80,
    this.image,
    this.extraChild,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.red;
    final Gradient gradient = RadialGradient(
      colors: [
        Color(0xFFFF8174),
        Colors.red,
      ],
      radius: 1,
      center: Alignment(-2, 0),
    );

    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: color,
                gradient: gradient,
                borderRadius: BorderRadius.circular(size / 2),
              ),
            ),
            Image.asset(image, width: size, height: size),
            extraChild ?? Container(width: 0, height: 0)
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: title ?? Text(''),
        )
      ],
    );
  }
}
