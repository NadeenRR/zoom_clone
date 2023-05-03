import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/color.dart';

class HomeMeetingButton extends StatelessWidget {
  const HomeMeetingButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
    this.defaultButtonColor = buttonColor,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final Color defaultButtonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: defaultButtonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.6),
                    offset: const Offset(0, 4))
              ]),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(color: Colors.grey),
        )
      ]),
    );
  }
}
