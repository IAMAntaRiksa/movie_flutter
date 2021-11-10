import 'package:flutter/material.dart';
import 'package:flutter_movie/data/remote/movie_remote_data_sourece.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:flutter_movie/ui/home/now_playing/home_playing_listview_screen.dart';

class MoviePlayingListView extends StatefulWidget {
  const MoviePlayingListView({
    Key? key,
  }) : super(key: key);

  @override
  _MoviePlayingListViewState createState() => _MoviePlayingListViewState();
}

class _MoviePlayingListViewState extends State<MoviePlayingListView> {
  final MovieRemoteDataSourcImpl _movieRemoteDataSourcImpl =
      MovieRemoteDataSourcImpl();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieItem>?>(
      future: _movieRemoteDataSourcImpl.listNowPlayingMovies(),
      builder: (context, AsyncSnapshot<List<MovieItem>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            List<MovieItem>? movie = snapshot.data!;
            return Column(
              children: [
                HomePlayingHorizontalListView(movieItemRespon: movie),
              ],
            );
          }
        } else {
          print('object');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
