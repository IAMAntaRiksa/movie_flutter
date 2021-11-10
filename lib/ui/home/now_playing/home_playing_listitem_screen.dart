import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/data/remote/movie_api_client.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';

class HomePlayingHorizontalListItem extends StatelessWidget {
  // final MovieItemResponse movieItems;
  final MovieItem movieItems;
  final VoidCallback onTap;
  const HomePlayingHorizontalListItem({
    Key? key,
    required this.movieItems,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ClipRRect(
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 250,
                    width: 200,
                    imageUrl: '$imagebaseUrl${movieItems.image}'),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              movieItems.judul,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_border,
                  color: Colors.orange,
                ),
                const Icon(
                  Icons.star_border,
                  color: Colors.orange,
                ),
                const Icon(
                  Icons.star_border,
                  color: Colors.orange,
                ),
                const Icon(
                  Icons.star_border,
                  color: Colors.orange,
                ),
                const Icon(
                  Icons.star_border,
                  color: Colors.orange,
                ),
                const SizedBox(width: 5),
                Text(
                  '${movieItems.ratting}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
