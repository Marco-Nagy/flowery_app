import 'package:flutter/material.dart';

import '../../../di/di.dart';
import '../../styles/animated_image.dart';
import '../../styles/colors/my_colors.dart';
import '../../styles/fonts/my_fonts.dart';


class AnimatedStatusDialog {
  const AnimatedStatusDialog._(); // Private constructor to prevent instantiation

  static void show({

    required Status status,
    required String message,
  }) {
    final navigatorContext =
        getIt<GlobalKey<NavigatorState>>().currentState?.context;

    if (navigatorContext != null) {
    showGeneralDialog(
      context: getIt<GlobalKey<NavigatorState>>().currentState!.context,
      pageBuilder: (ctx, a1, a2) => const SizedBox.shrink(),
      transitionBuilder: (ctx, a1, a2, child) {
        final curveValue = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curveValue,
          child: _dialog(ctx, status, message),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
  }

  static Widget _dialog(BuildContext context, Status status, String message) {
    final statusValue = _getStatusValues(status);

    return AlertDialog(
      backgroundColor: MyColors.white,
      title: Text(
        statusValue.title,
        style: MyFonts.styleBold700_18.copyWith(color: statusValue.startColor),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message,
          style: MyFonts.styleSemiBold600_16.copyWith(color: statusValue.startColor),
        ),
          // SizedBox(
          //   height: 120.h,
          //   width: 120.w,
          //   child: Center(
          //     child: Lottie.asset(
          //       statusValue.imagePath,
          //       repeat: true,
          //       fit: BoxFit.fitWidth,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  static _StatusValue _getStatusValues(Status status) {
    switch (status) {
      case Status.loading:
        return  _StatusValue(
          startColor: MyColors.blue,
          title: 'Loading...',
          imagePath: AnimatedImage.loading,
        );
      case Status.success:
        return  _StatusValue(
          startColor: Colors.green,
          title: 'Success!',
          imagePath: AnimatedImage.success,
        );
      case Status.error:
        return  _StatusValue(
          startColor: Colors.red,
          title: 'Error!',
          imagePath: AnimatedImage.error,
        );
    }
  }
}

class _StatusValue {
  final Color startColor;
  final String title;
  final String imagePath;

  const _StatusValue({
    required this.startColor,
    required this.title,
    required this.imagePath,
  });
}

enum Status { loading, success, error }
