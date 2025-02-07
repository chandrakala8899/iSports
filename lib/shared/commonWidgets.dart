import 'package:flutter/material.dart';
import 'package:isports/shared/theme_data.dart';

Widget getProfileCreationHeader(
    {required String title, required String subtitle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w600,color: Color(0xFF2A2B2F),),
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        subtitle,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff697586)),
      ),
    ],
  );
}

Widget getLabel(String label) {
  return Text(label,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14));
}

InputDecoration getInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: Colors.white,
      filled: true);
}

class AmountDisplay extends StatelessWidget {
  final String currencySymbol;
  final double amount;
  final String period;
  final bool isSelected;
  final TextStyle? amountStyle;
  final TextStyle? periodStyle;

  const AmountDisplay({
    super.key,
    required this.currencySymbol,
    required this.amount,
    required this.period,
    this.isSelected = false,
    this.amountStyle,
    this.periodStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultAmountStyle = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: isSelected ? Colors.white : const Color(0xFF000000),
    );

    final defaultPeriodStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: isSelected ? Colors.white : const Color(0xFF697586),
    );

    return RichText(
      text: TextSpan(
        text: currencySymbol,
        style: TextStyle(
          fontSize: periodStyle?.fontSize == null ? 32 : 16,
          fontWeight: FontWeight.w400,
          color: isSelected ? Colors.white : const Color(0xFF000000),
        ),
        children: [
          TextSpan(
            text: amount.toStringAsFixed(0),
            style: amountStyle ?? defaultAmountStyle,
          ),
          TextSpan(
            text: ' $period',
            style: periodStyle ?? defaultPeriodStyle,
          ),
        ],
      ),
    );
  }
}
