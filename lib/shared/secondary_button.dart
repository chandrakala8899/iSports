import 'package:flutter/material.dart';
import 'package:isports/shared/theme_data.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;
  final double height;
  final double width;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isDisabled = false,
    this.height = 56,
    this.width = double.infinity,
    this.borderColor,
    this.textColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isDisabled ? Colors.grey[200] : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isDisabled ? Colors.grey[400]! : (borderColor ?? primaryColor),
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ??
              Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: isDisabled
                        ? Colors.grey[400]
                        : (textColor ?? primaryColor),
                    fontWeight: FontWeight.bold,
                  ),
        ),
      ),
    );
  }
}
