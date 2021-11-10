import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_movie/data/remote/movie_remote_data_sourece.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRemoteDataSourcImpl remote = MovieRemoteDataSourcImpl();
  MovieBloc() : super(InitialMovieState()) {
    on<GetPopularMovieEvent>((event, emit) async {
      emit(GetPopularMovieLoading());
      List<MovieItem>? itemMovie = await remote.listNowPlayingMovies();

      if (itemMovie == null) {
        /// error
        emit(GetPopularMovieLoError(massage: 'Failed to get movies'));
      } else {
        emit(GetPopularMovieLoaded(movieLoaded: itemMovie));
      }
    });
  }
}
