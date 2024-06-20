import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/utils/functions/save_books.dart';
import 'package:bookly_app/features/home/Data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  ApiServices apiServices;
  HomeRemoteDataSourceImpl({
    required this.apiServices,
  });
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServices.get('volumes?Filtering=free-ebooks&q=subject:Programming');
    List<BookEntity> books = getBooks(data);
    saveBooks(books,kFeaturedBox);
    return books;
  }


 
  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
   var data = await apiServices.get('volumes?Filtering=free-ebooks&q=subject:Programming&sorting=newest');
    List<BookEntity> books = getBooks(data);

    return books;
  }



   List<BookEntity> getBooks(Map<String, dynamic> data) {
       List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

}
