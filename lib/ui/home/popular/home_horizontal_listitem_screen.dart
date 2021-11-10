import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_movie/data/remote/movie_api_client.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';

class HomeHorizontalListItemWidget extends StatelessWidget {
  final MovieItem movieItemR;

  final VoidCallback onTap;
  const HomeHorizontalListItemWidget({
    Key? key,
    required this.movieItemR,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 0, maxHeight: 200),
        child: Stack(
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: '$imagebaseUrl${movieItemR.image}',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                placeholder: (context, url) => Platform.isAndroid
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator(),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            Positioned(
              left: 0,
              bottom: 20,
              child: Text(
                movieItemR.judul,
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
