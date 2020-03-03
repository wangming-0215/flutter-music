import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:music/widgets/future_widget.dart';
import 'package:music/widgets/banner.dart';
import 'package:music/widgets/skeleton_widget.dart';

class HomeBanner extends StatelessWidget {
  final Future future;

  HomeBanner({@required this.future});

  @override
  Widget build(BuildContext context) {
    print('build HomeBanner Widget');
    final double _aspectRadio = 1080 / 400;

    return CustomFutureWidget(
      future: future,
      loadingWidget: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        child: SkeletonWidget(
          child: AspectRatio(
            aspectRatio: _aspectRadio,
            child: Container(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          ),
        ),
      ),
      itemBuilder: (context, data, _) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          child: CustomBanner(
            aspectRadio: _aspectRadio,
            itemCount: data.length,
            autoPlay: true,
            itemBuilder: (context, index) {
              return FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: data[index % data.length].pic,
                fit: BoxFit.fill,
              );
            },
          ),
        );
      },
    );
  }
}
