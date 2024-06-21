import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/bestseller_listview_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListview extends StatelessWidget {
  const NewestBooksListview({super.key, required this.books});
 final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return  Padding(
          padding:const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(book: books[index],),
        );
      },
      itemCount: 10,
    );
  }
}
