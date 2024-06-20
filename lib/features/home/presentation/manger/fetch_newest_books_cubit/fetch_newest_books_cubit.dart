import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.homeRepo) : super(FetchNewestBooksInitial());

    HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FetchNewestBooksFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(FetchNewestBooksSuccess(books: books));
    });
  }
}
