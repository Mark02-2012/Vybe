import 'package:flutter/material.dart';

class FFButtonWidget extends StatelessWidget {
  const FFButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.options,
    this.icon,
  });

  final VoidCallback? onPressed;
  final String text;
  final FFButtonOptions options;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: options.width,
      height: options.height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: options.color,
          textStyle: options.textStyle,
          elevation: options.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(options.borderRadius ?? 8.0),
            side: options.borderSide ?? BorderSide.none,
          ),
          padding: options.padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 8)],
            Text(text, style: options.textStyle),
          ],
        ),
      ),
    );
  }
}

class FFButtonOptions {
  const FFButtonOptions({
    this.width,
    this.height,
    this.color,
    this.textStyle,
    this.elevation,
    this.borderRadius,
    this.borderSide,
    this.padding,
  });

  final double? width;
  final double? height;
  final Color? color;
  final TextStyle? textStyle;
  final double? elevation;
  final double? borderRadius;
  final BorderSide? borderSide;
  final EdgeInsetsGeometry? padding;
}
