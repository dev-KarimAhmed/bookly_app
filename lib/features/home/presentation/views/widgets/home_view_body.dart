import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manger/fetch_feature_books_cubit/fetch_feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/bes_seller_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appBar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              HorizontalListViewBloc(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'News Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: NewestBooksListViewBloc(),
          ),
        ),
      ],
    );
  }
}

class NewestBooksListViewBloc extends StatelessWidget {
  const NewestBooksListViewBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          return NewestBooksListview(
            books: state.books,
          );
        } else if (state is FetchNewestBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class HorizontalListViewBloc extends StatefulWidget {
  const HorizontalListViewBloc({
    super.key,
  });

  @override
  State<HorizontalListViewBloc> createState() => _HorizontalListViewBlocState();
}

class _HorizontalListViewBlocState extends State<HorizontalListViewBloc> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeatureBooksCubit, FetchFeatureBooksState>(
      listener: (context, state) {
        if (state is FetchFeatureBooksSuccess) {
          books = state.books;
        }
        if (state is FetchFeatureBooksFailurePagination) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FetchFeatureBooksSuccess ||
            state is FetchFeatureBooksLoadingPagination ||
            state is FetchFeatureBooksFailurePagination) {
          return CustomBooksListView(
            books: books,
          );
        } else if (state is FetchFeatureBooksFailure) {
          return Text(state.message);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ));
        }
      },
    );
  }
}
