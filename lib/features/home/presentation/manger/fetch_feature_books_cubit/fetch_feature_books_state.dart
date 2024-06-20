part of 'fetch_feature_books_cubit.dart';

sealed class FetchFeatureBooksState extends Equatable {
  const FetchFeatureBooksState();

  @override
  List<Object> get props => [];
}

final class FetchFeatureBooksInitial extends FetchFeatureBooksState {}

final class FetchFeatureBooksLoading extends FetchFeatureBooksState {}

final class FetchFeatureBooksSuccess extends FetchFeatureBooksState {
  final List<BookEntity> books;
  const FetchFeatureBooksSuccess(this.books);
}

final class FetchFeatureBooksFailure extends FetchFeatureBooksState {
  final String message;
  const FetchFeatureBooksFailure(this.message);
}
