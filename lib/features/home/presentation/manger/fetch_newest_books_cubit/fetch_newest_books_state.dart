part of 'fetch_newest_books_cubit.dart';

sealed class FetchNewestBooksState extends Equatable {
  const FetchNewestBooksState();

  @override
  List<Object> get props => [];
}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}

final class FetchNewestBooksLoading extends FetchNewestBooksState {}

final class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity> books;

 const FetchNewestBooksSuccess({required this.books});
}

final class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errMessage;
  const FetchNewestBooksFailure({required this.errMessage});
}
