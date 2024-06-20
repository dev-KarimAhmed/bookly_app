import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'fetch_feature_books_state.dart';

class FetchFeatureBooksCubit extends Cubit<FetchFeatureBooksState> {
  FetchFeatureBooksCubit(this.homeRepo) : super(FetchFeatureBooksInitial());
  HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchFeatureBooksLoading());
    } else {
      emit(FetchFeatureBooksLoadingPagination());
    }
    var result = await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FetchFeatureBooksFailure(failure.errMessage));
      } else {
        emit(FetchFeatureBooksFailurePagination(failure.errMessage));
      }
    }, (books) {
      emit(FetchFeatureBooksSuccess(books));
    });
  }
}
