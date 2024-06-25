import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_adv/features/home/data/model/movie_model.dart';

import 'package:movie_app_adv/features/home/data/repo/home_repo.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.homeRepo) : super(HomePageInitial());

  final HomeRepo homeRepo;

  Future<void> getAllMovies() async {
    emit(HomePageLoading());

    var result = await homeRepo.getAllMovies();

    result.fold((Failure) => emit(HomePageFailure(Failure.message)),
        (movies) => emit(HomePageSuccess(movies)));
  }
}
