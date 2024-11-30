import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverSomethingList extends StatefulWidget {
  const DiscoverSomethingList({super.key});

  @override
  State<DiscoverSomethingList> createState() => _DiscoverSomethingListState();
}

class _DiscoverSomethingListState extends State<DiscoverSomethingList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Stack(
            children: [
              // Container(
              //     margin: EdgeInsets.all(5.sp),
              //     child: ClipRRect(
              //         borderRadius: BorderRadius.circular(18.sp),
              //         child: Image.asset('assets/images/graduation.png'))),
              // Container(
              //   margin: EdgeInsets.all(5.sp),
              //   child: Align(
              //     alignment: Alignment.bottomRight,
              //     child: Image.asset(
              //       'assets/images/card_content.png',
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
