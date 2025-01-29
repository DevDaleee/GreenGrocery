import 'package:flutter/material.dart';
import 'package:hortifruit/src/config/custom_colors.dart';

class QuantitiyWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;

  const QuantitiyWidget({
    super.key,
    required this.value,
    required this.suffixText,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        spacing: 10,
        children: [
          _QuantityButton(
            icon: Icons.remove,
            color: Colors.grey,
            onPressed: () {
              if (value == 1) return;
              int partialResult = value - 1;
              result(partialResult);
            },
          ),
          Text(
            '$value$suffixText',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            color: CustomColors.customSwatchColor,
            onPressed: () {
              int partialResult = value + 1;
              result(partialResult);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  const _QuantityButton({
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
