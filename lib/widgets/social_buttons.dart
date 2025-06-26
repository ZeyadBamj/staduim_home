import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final String image;
  final Color color;
  final Color bgColor;
  final Color? photoColor;

  const SocialButton({
    super.key,
    this.photoColor,
    required this.label,
    required this.image,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.1,
              color: photoColor,
            ),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
