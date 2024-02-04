import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star,
          color: Color(0xffFFdd4f),
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          '4.8',
          style: Styles.textStyle18,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '(2390)',
          style: Styles.textStyle14,
        )
      ],
    );
  }
}
