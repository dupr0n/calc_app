import 'package:flutter/material.dart';

class CalcButtonWidget extends StatelessWidget {
  const CalcButtonWidget({
    @required this.label,
    this.width = -1.0,
    @required this.onTap,
    this.backgroundColor = Colors.white,
    this.labelColor = Colors.black,
  });

  final String label;
  final double width;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    final size = width == -1 ? MediaQuery.of(context).size.width / 4 - 12 : width;
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 2),
          ],
          borderRadius: BorderRadius.all(Radius.circular(size / 2)),
          color: backgroundColor,
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(size / 2)),
          ),
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 24, color: labelColor),
            ),
          ),
        ),
      ),
    );
  }
}
