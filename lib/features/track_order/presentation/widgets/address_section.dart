import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/core/styles/fonts/my_fonts.dart';
import 'package:flowery_e_commerce/core/utils/widgets/spacing.dart';
import 'package:flowery_e_commerce/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AddressSection extends StatelessWidget {
  final String title, name, address, image , phone;

  const AddressSection(
      {super.key,
      required this.title,
      required this.name,
      required this.address,
      required this.image,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   border: Border.all(color: Colors.grey.shade300),
          // ),
          child: Row(
            spacing: 12.w,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: image,
                  width: 44.w,
                  height: 44.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: SpinKitWave(
                      color: MyColors.baseColor,
                      size: 30.w,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    size: 44.w,
                    color: MyColors.gray,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: MyFonts.styleRegular400_14,
                    ),
                    verticalSpacing(4.h),
                    Row(
                      children: [

                        Flexible(
                          child: AutoSizeText(
                            address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: MyFonts.styleMedium500_13.copyWith(
                              color: MyColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  launchUrlString("tel://$phone");
                },
                child: SvgPicture.asset(Assets.imagesCall,
                    width: 20.w,
                    height: 20.h,
                    colorFilter:
                        const ColorFilter.mode(MyColors.baseColor, BlendMode.srcIn)),
              ),
              InkWell(
                onTap: () {
                  launchUrlString("https://wa.me/$phone");
                },
                child: SvgPicture.asset(Assets.imagesWhatsapp,
                    width: 20.w,
                    height: 20.h,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
