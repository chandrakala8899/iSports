import 'package:flutter/material.dart';
import 'package:isports/shared/theme_data.dart';

class SelectionItemChip extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  const SelectionItemChip(
      {super.key,
      required this.label,
      required this.onTap,
      required this.isSelected});

  @override
  State<SelectionItemChip> createState() => _SelectionItemChipState();
}

class _SelectionItemChipState extends State<SelectionItemChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => widget.onTap.call(),
        child: Container(
          decoration: BoxDecoration(
              color: widget.isSelected ? primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: widget.isSelected ? Colors.white : Color(0xff697586)),
            ),
          ),
        ),
      ),
    );
  }
}
