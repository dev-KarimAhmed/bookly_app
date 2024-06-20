import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'fetch_feature_books_state.dart';

class FetchFeatureBooksCubit extends Cubit<FetchFeatureBooksState> {
  FetchFeatureBooksCubit(this.homeRepo) : super(FetchFeatureBooksInitial());
  HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(FetchFeatureBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
    result.fold((failure) {
      emit(FetchFeatureBooksFailure(failure.errMessage));
    }, (books) {
      emit(FetchFeatureBooksSuccess(books));
    });
  }
}
