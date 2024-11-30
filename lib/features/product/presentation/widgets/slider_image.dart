import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/features/generic/presentation/widgets/cached_network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({super.key, required this.imageUrls});
  final List<String?>imageUrls;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 448.h,
      initialPage: 0,
      indicatorPadding: 15,
      indicatorColor: MyColors.baseColor,
      indicatorBackgroundColor: MyColors.white70,
      isLoop: true,
      autoPlayInterval: null,
      children: imageUrls.map((url) {
        return CachedNetworkWidget(imageUrl: url!,);
      }).toList(),
    );
  }
}
