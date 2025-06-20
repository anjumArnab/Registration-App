import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Size? minimumSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? iconSize;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    this.elevation = 5,
    this.padding = const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    this.borderRadius,
    this.minimumSize = const Size(double.infinity, 56),
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.letterSpacing = 0.5,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          letterSpacing: letterSpacing,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(5),
        ),
        minimumSize: minimumSize,
      ),
    );
  }
}
