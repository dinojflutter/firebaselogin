import 'package:flutter/material.dart';

class PrimaryButtons extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onpressed;
  const PrimaryButtons(
      {super.key,
      required this.text,
      required this.onpressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(18)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
