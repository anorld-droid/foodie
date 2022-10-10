import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;
  final double size;
  final Gradient gradient;
  final bool enableFeedback;
  const GradientIcon(this.onPressed,
      {Key? key,
      this.enableFeedback = true,
      required this.icon,
      required this.size,
      required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
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
