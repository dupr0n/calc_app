import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.only(right: 24, bottom: 24),
        child: Text(
          text,
          softWrap: true,
          style: const TextStyle(color: Colors.white, fontSize: 65),
        ),
      ),
    );
  }
}
