import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewestBooksCover extends StatelessWidget {
  final String image;
  const NewestBooksCover({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: AspectRatio(
        aspectRatio: 2.05 / 3,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(13.0),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: image,
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error_outline)),
          ),
        ),
      ),
    );
  }
}
