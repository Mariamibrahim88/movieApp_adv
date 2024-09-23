import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_adv/features/category/data/model/category_model.dart';
import 'package:movie_app_adv/features/category/data/repo/category_repo.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit(this.categoryRepo) : super(GetCategoryInitial());
  final CategoryRepo categoryRepo;

  Future<void> getCategories() async {
    emit(GetCategoryLoading());
    var result = await categoryRepo.getCategories();
    result.fold(
      (Failure) => emit(GetCategoryFailure(Failure.message)),
      (categories) => emit(GetCategorySuccess(categories)),
    );
  }
}
