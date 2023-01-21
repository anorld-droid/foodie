import 'package:flutter/material.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 17.01.2023.
class GradientIcon extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  final double size;
  final Gradient gradient;
  final bool enableFeedback;

  const GradientIcon(
      {Key? key,
      this.onPressed,
      this.enableFeedback = true,
      required this.icon,
      required this.size,
      required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.5,
        height: size * 1.5,
        child: IconButton(
          enableFeedback: enableFeedback,
          icon: icon,
          iconSize: size,
          color: Colors.white,
          onPressed: onPressed,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}