import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/bestseller_listview_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appBar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_books_listview.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              CustomBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Best Seller',
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
            child: BestSellerListview(),
          ),
        ),
      ],
    );
  }
}

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BestSellerListViewItem(),
        );
      },
      itemCount: 10,
    );
  }
}
