part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMovieEvent extends MovieEvent {}

class GetNoPlayingMovieEvent extends MovieEvent {}

class GetMovieDetailEvent extends MovieEvent {
  final int movieId;
  const GetMovieDetailEvent({
    required this.movieId,
  });

  @override
  List<Object> get props => [movieId];
}

class GetSearchMovieEvent extends MovieEvent {
  final String keyword;
  const GetSearchMovieEvent({
    required this.keyword,
  });
  @override
  List<Object> get props => [keyword];
}

class GetFavoriteMovieEvent extends MovieEvent {}
