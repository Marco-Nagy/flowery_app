import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../generated/assets.dart';


class CachedNetworkWidget extends StatelessWidget {
  const CachedNetworkWidget({super.key, required this.imageUrl,  this.height,});
  final String imageUrl;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      height: height,
      imageUrl: imageUrl,
      width: double.infinity,
      fit: BoxFit.fitWidth,
      placeholder: (context, url) => Lottie.asset(Assets.imagesLoading),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
