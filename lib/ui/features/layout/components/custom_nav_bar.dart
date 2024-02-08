import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_link_app/config/colors/app_colors.dart';

import '../controller/layout_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) => SizedBox(
          height: 52.h,
          child: CustomNavigationBar(
            iconSize: 25,
            borderRadius: const Radius.circular(15),
            selectedColor: const Color(AppColors.kPrimaryColor),
            isFloating: true,
            strokeColor: const Color(AppColors.kPrimaryColor),
            items: LayoutCubit.get(context).navigationItems,
            currentIndex: LayoutCubit.get(context).currentIndex,
            onTap: (index) {
              LayoutCubit.get(context).changeIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
