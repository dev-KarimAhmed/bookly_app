import 'package:bookly_app/core/utils/custom_error_text.dart';
import 'package:bookly_app/core/utils/custom_progress_indicator.dart';
import 'package:bookly_app/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarCustomBooksListView extends StatelessWidget {
  const SimilarCustomBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imageUrl: state.books[index].volumeInfo?.imageLinks?.thumbnail,
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return ErrorText(text: state.errMessage);
        } else {
          return const CustomCircleProgressIndicator();
        }
      },
    );
  }
}
