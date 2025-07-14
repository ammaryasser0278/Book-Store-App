import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookCard extends StatelessWidget {
  final String imageUrl;
  const CustomBookCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.05 / 3,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(13.0),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error_outline)),
        ),
      ),
    );
  }
}
