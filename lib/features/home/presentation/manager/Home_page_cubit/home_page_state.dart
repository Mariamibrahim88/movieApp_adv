part of 'home_page_cubit.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class HomePageLoading extends HomePageState {}

final class HomePageSuccess extends HomePageState {
  final List<MovieModel> movies;

  HomePageSuccess(this.movies);
}

final class HomePageFailure extends HomePageState {
  final String errMessage;

  HomePageFailure(this.errMessage);
}
