import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarCustomBooksListView extends StatelessWidget {
  const SimilarCustomBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imageUrl: kMyImage,
                    ),
                  );
                }),
          );
  }
}
