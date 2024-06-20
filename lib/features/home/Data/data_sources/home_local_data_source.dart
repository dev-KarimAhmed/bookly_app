import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    return getDataFromHiveBox(kFeaturedBox);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    return getDataFromHiveBox(kNewestBox);
  }

  List<BookEntity> getDataFromHiveBox(String boxName) {
    var box = Hive.box<BookEntity>(boxName);
    return box.values.toList();
  }
}
