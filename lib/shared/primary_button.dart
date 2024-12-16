import 'package:flutter/material.dart';
import 'package:isports/shared/theme_data.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;
  final double height;
  final double width;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? borderRadius;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isDisabled = false,
    this.height = 56,
    this.width = double.infinity,
    this.backgroundColor,
    this.textStyle,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: isDisabled ? Colors.grey[400] : primaryColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 8)),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ??
              Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
