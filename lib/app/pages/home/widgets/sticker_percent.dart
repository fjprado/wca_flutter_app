import 'dart:math';
import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';

class StickerPercent extends StatelessWidget {
  final int percent;

  const StickerPercent({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: context.colors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$percent%',
              style: context.textStyles.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox(
          width: 110,
          height: 110,
          child: Transform.rotate(
            angle: -pi / 2.0,
            child: CircularProgressIndicator(
              value: percent / 100,
              color: context.colors.yellow
                  .withOpacity(.3 + (percent / 100 <= .7 ? percent / 100 : .7)),
              strokeWidth: 5,
              backgroundColor: Colors.white.withOpacity(0.5),
            ),
          ),
        )
      ],
    );
  }
}
