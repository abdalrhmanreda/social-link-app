import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_link_app/ui/features/layout/controller/layout_cubit.dart';

import '../components/custom_fab.dart';
import '../components/custom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: LayoutCubit.get(context)
              .screens[LayoutCubit.get(context).currentIndex],
          bottomNavigationBar: const CustomNavBar(),
          floatingActionButton: const CustomFloatingActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
