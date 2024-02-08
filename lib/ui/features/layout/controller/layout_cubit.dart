import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:social_link_app/ui/features/chat/screens/chat.dart';
import 'package:social_link_app/ui/features/feeds/screens/feeds.dart';
import 'package:social_link_app/ui/features/profile/screens/profile.dart';
import 'package:social_link_app/ui/features/reels/screens/reels.dart';

import '../components/feed_leading.dart';
import '../components/profile_action_item.dart';
import '../components/profile_leading.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  List<Widget> leading = [
    const FeedLeading(),
    const ProfileLeading(),
    const ProfileLeading(),
    const ProfileLeading(),
  ];

  List<CustomNavigationBarItem> navigationItems = [
    CustomNavigationBarItem(
      icon: const Icon(Iconsax.home_1_outline),
      selectedIcon: const Icon(Iconsax.home_1_bold),
    ),
    CustomNavigationBarItem(
        icon: const Icon(Iconsax.video_square_outline),
        selectedIcon: const Icon(Iconsax.video_square_bold)),
    CustomNavigationBarItem(
      icon: const Icon(Iconsax.message_2_outline),
      selectedIcon: const Icon(Iconsax.message_2_bold),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Iconsax.profile_circle_outline),
      selectedIcon: const Icon(Iconsax.profile_circle_bold),
    ),
  ];
  List<Widget> screens = [
    const FeedsScreen(),
    const ReelsScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
  List<List<Widget>> actions = [
    [
      const Icon(Iconsax.notification_circle_outline),
      Gap(15.w),
      const Icon(Iconsax.user_search_outline),
    ],
    [const ProfileActionItem()],
    [const ProfileActionItem()],
    [const ProfileActionItem()]
  ];
}
