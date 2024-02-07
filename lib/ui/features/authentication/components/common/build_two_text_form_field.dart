import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../generated/l10n.dart';
import '../../controller/auth_cubit.dart';
import 'container_with_text_from_feild.dart';

class CustomTwoTextFromField extends StatefulWidget {
  const CustomTwoTextFromField({
    super.key,
    required this.firstController,
    required this.secondController,
    required this.firstHint,
    required this.secondHint,
  });

  final TextEditingController firstController;
  final TextEditingController secondController;
  final String firstHint;
  final String secondHint;

  @override
  State<CustomTwoTextFromField> createState() => _CustomTwoTextFromFieldState();
}

class _CustomTwoTextFromFieldState extends State<CustomTwoTextFromField> {
  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).email,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 15.sp),
            ),
            const Gap(10),
            ContainerTextFormFeild(
              isPass: false,
              controller: widget.firstController,
              hint: widget.firstHint,
              keyboardType: TextInputType.emailAddress,
            ),
            const Gap(20),
            Text(
              S.of(context).password,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 15.sp),
            ),
            const Gap(10),
            ContainerTextFormFeild(
              isPass: isPass,
              controller: widget.secondController,
              hint: widget.secondHint,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon:
                  isPass ? Iconsax.eye_outline : Iconsax.eye_slash_outline,
              suffixPressed: () {
                setState(() {
                  isPass = !isPass;
                });
                // AuthCubit.get(context).changePasswordIcon(isPass2);
              },
            ),
          ],
        );
      },
    );
  }
}
