import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatelessWidget {
  const FlutterFlowIconButton({
    super.key,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonSize,
    this.fillColor,
    required this.icon,
    this.onPressed,
  });

  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final double? buttonSize;
  final Color? fillColor;
  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        child: Container(
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(
            color: fillColor ?? Colors.transparent,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 0,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
