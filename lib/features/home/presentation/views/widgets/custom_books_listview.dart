// ignore_for_file: library_private_types_in_public_api

import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manger/fetch_feature_books_cubit/fetch_feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBooksListView extends StatefulWidget {
  const CustomBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  _CustomBooksListViewState createState() => _CustomBooksListViewState();
}

class _CustomBooksListViewState extends State<CustomBooksListView> {
  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        // We are at the bottom, so fetch more books
        if (!isLoading) {
          isLoading = true;
          BlocProvider.of<FetchFeatureBooksCubit>(context)
              .fetchFeaturedBooks(pageNumber: nextPage++);
          isLoading = false;
        }
      }
    } else {
      final position = _scrollController.position;
      if (position.pixels >= position.maxScrollExtent * 0.7) {
        // We have scrolled to 70% of the list
        if (!isLoading) {
          isLoading = true;
          BlocProvider.of<FetchFeatureBooksCubit>(context)
              .fetchFeaturedBooks(pageNumber: nextPage++);
          isLoading = false;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .23,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(
              imageUrl: widget.books[index].image ?? kMyImage,
            ),
          );
        },
      ),
    );
  }
}
