import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

part 'fetch_feature_books_state.dart';

class FetchFeatureBooksCubit extends Cubit<FetchFeatureBooksState> {
  FetchFeatureBooksCubit() : super(FetchFeatureBooksInitial());
}
