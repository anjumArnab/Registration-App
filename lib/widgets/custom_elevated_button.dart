import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed; // Made nullable
  final String label;
  final IconData? icon; // Made nullable
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
  final bool showLoadingIndicator;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.backgroundColor = const Color(0xFF1976D2),
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
    this.showLoadingIndicator = false,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if button should show loading indicator
    bool isLoading = onPressed == null && showLoadingIndicator;

    // If there's an icon, use ElevatedButton.icon, otherwise use regular ElevatedButton
    if (icon != null && !isLoading) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon!,
          size: iconSize,
          color: onPressed != null ? iconColor : disabledForegroundColor,
        ),
        label: Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: onPressed != null ? textColor : disabledForegroundColor,
            letterSpacing: letterSpacing,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              onPressed != null ? backgroundColor : disabledBackgroundColor,
          foregroundColor:
              onPressed != null ? foregroundColor : disabledForegroundColor,
          elevation: onPressed != null ? elevation : 0,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5),
          ),
          minimumSize: minimumSize,
        ),
      );
    } else {
      // Regular ElevatedButton for text-only or loading state
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              onPressed != null ? backgroundColor : disabledBackgroundColor,
          foregroundColor:
              onPressed != null ? foregroundColor : disabledForegroundColor,
          elevation: onPressed != null ? elevation : 0,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5),
          ),
          minimumSize: minimumSize,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) ...[
              SizedBox(
                width: iconSize ?? 20,
                height: iconSize ?? 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    textColor ?? Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: onPressed != null ? textColor : disabledForegroundColor,
                letterSpacing: letterSpacing,
              ),
            ),
          ],
        ),
      );
    }
  }
}
