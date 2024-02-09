import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
