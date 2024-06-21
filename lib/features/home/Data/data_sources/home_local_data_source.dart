import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    return getDataFromHiveBox(kFeaturedBox, pageNumber: pageNumber);
  }




  @override
  List<BookEntity> fetchNewestBooks() {
    return getDataFromHiveBox(kNewestBox);
  }

  List<BookEntity> getDataFromHiveBox(String boxName, {int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(boxName);
    int start = pageNumber * 10;
    int end = (pageNumber + 1) * 10;
    if (start >= box.values.length || end > box.values.length) {
      return [];
    }
    return box.values.toList().sublist(start);
  }
}
