// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../widgets/custom_address_details.dart';
//
// void showCustomAddressBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: false,
//     backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     enableDrag: false,
//     isDismissible: false,
//     barrierColor: Colors.transparent,
//     builder: (context) {
//       return DraggableScrollableSheet(
//         initialChildSize: 0.4,
//         // ارتفاع مبدئي أكبر
//         minChildSize: 0.3,
//         maxChildSize: 0.9,
//         expand: false,
//         builder: (context, scrollController) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             child: Column(
//               children: [
//                 Container(
//                   height: 5.h,
//                   width: 50.w,
//                   margin: EdgeInsets.symmetric(vertical: 8.h),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[400],
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     controller: scrollController,
//                     child: const CustomAddressDetails(),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }
