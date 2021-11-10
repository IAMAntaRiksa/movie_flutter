import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/data/remote/movie_api_client.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MovieGridItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  final MovieItem movie;

  const MovieGridItemWidget({
    Key? key,
    required this.movie,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: InkWell(
              onTap: onTap,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: '$imagebaseUrl${movie.image}',
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: const FaIcon(
                  FontAwesomeIcons.bookmark,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
