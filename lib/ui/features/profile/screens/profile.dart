import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:social_link_app/ui/features/authentication/controller/auth_cubit.dart';
import 'package:social_link_app/ui/features/profile/models/counter_model.dart';

import '../components/cover_and_profile_images.dart';
import '../components/likes_and_followers_and_posts.dart';
import '../components/name_and_bio.dart';
import '../components/profile_buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CounterModel> counts = const [
      CounterModel(count: 524, textWantCount: 'posts'),
      CounterModel(count: 45.6, textWantCount: 'Followers'),
      CounterModel(count: 20, textWantCount: 'Following'),
      CounterModel(count: 10, textWantCount: 'Likes'),
    ];
    String image2 =
        'https://scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/418427080_3569188013410381_8377552760417855759_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=hyeiYaX85F4AX-sKAM3&_nc_ht=scontent.fcai22-1.fna&oh=00_AfC9aSUCUkp7HcmUOZmIh7I5_mv8bycOa1fm69sgWiIsLw&oe=65C98B75';
    String image =
        'https://scontent.fcai22-4.fna.fbcdn.net/v/t39.30808-6/402197955_3536699043325945_6296573774095780653_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=783fdb&_nc_ohc=z1l83zMOZDkAX9fRO9H&_nc_ht=scontent.fcai22-4.fna&oh=00_AfCgVgSLbqHSPSe6rcx0428DQjV3bQ-nqUGP_l4tU_pHTg&oe=65C9C28C';

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                ProfileImages(
                  profile: AuthCubit.get(context).userModel!.profileImage!,
                ),
                NameAndBio(
                  name: AuthCubit.get(context).userModel!.name!,
                  bio: AuthCubit.get(context).userModel!.bio!,
                ),
                const Gap(15),
                LikesAndPostsAndFollowers(counts: counts),
                const Gap(15),
                ProfileButtons(
                  uId: AuthCubit.get(context).userModel!.uId!,
                ),
                ListView.builder(
                  key: UniqueKey(),
                  // Add a unique key here
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Item $index'),
                  ),
                  itemCount: 100,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
