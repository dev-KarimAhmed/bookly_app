import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/bestseller_listview_item.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Results',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          // Expanded(
          //   child: SearchResultListView(),
          // ),
        ],
      ),
    );
  }
}

// class SearchResultListView extends StatelessWidget {
//   const SearchResultListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       padding: EdgeInsets.zero,
//       itemBuilder: (context, index) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           child: BookListViewItem(),
//         );
//       },
//       itemCount: 10,
//     );
//   }
// }
