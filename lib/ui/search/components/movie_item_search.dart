import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';

class HomeItemSearch extends StatelessWidget {
  const HomeItemSearch({
    Key? key,
    required this.movieItems,
    required this.onTap,
  }) : super(key: key);
  final MovieItem movieItems;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white60,
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('You Stardet Watcing'),
              Flexible(
                child: Text(
                  movieItems.judul,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
