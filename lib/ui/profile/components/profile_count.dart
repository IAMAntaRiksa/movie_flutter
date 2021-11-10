import 'package:flutter/material.dart';
import 'package:flutter_movie/values/text_style.dart';

class ProfileCounteListViewWidget extends StatelessWidget {
  const ProfileCounteListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 35),
        ProfileCountWidget(
          count: 12,
          label: 'Watched',
          onTap: () {},
        ),
        ProfileCountWidget(
          count: 10900,
          label: 'Started',
          onTap: () {},
        ),
        ProfileCountWidget(
          count: 11,
          label: 'Favorite',
          onTap: () {},
        ),
        const SizedBox(width: 35),
      ],
    );
  }
}

class ProfileCountWidget extends StatelessWidget {
  final int count;
  final String label;
  final VoidCallback? onTap;

  const ProfileCountWidget({
    Key? key,
    required this.count,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('21', style: titleTextStyleKecil),
        const SizedBox(height: 1),
        Text(label, style: titleTextStyleKecil),
      ],
    );
  }
}
