part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class InitialMovieState extends MovieState {}

class GetPopularMovieLoading extends MovieState {}

class GetPopularMovieLoaded extends MovieState {
  List<MovieItem> movieLoaded;
  GetPopularMovieLoaded({
    required this.movieLoaded,
  });
  @override
  List<Object> get props => [movieLoaded];
}

class GetPopularMovieLoError extends MovieState {
  final String massage;
  GetPopularMovieLoError({
    required this.massage,
  });
  @override
  List<Object> get props => [massage];
}
