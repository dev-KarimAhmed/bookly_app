import 'package:bookly_app/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding:const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                const  BookDetailsAppBar(),
                const  SizedBox(
                    height: 15,
                  ),
                  BookDetailsSection(),
               const   Expanded(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                const  SimilarBooksSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
