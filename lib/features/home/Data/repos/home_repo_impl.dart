import 'package:dartz/dartz.dart';

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/Data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/Data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource remoteDataSource;
  HomeLocalDataSource localDataSource;
  HomeRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books = [];
      books = localDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return Right(books);
      }

      books = await remoteDataSource.fetchFeaturedBooks();
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks() async {
    try {
      List<BookEntity> books = [];
      books = localDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return Right(books);
      }

      books = await remoteDataSource.fetchNewestBooks();
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
