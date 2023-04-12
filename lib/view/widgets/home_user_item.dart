import 'package:bank_sha/models/response/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUserItem extends StatelessWidget {
  final UserModel user;

  const HomeUserItem({super.key, required this.user});

  // final String imageUrl;
  // final String username;

  // const HomeUserItem(
  //     {super.key, required this.imageUrl, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: user.profilePicture == null
                      ? AssetImage('assets/img_profile.png')
                      : NetworkImage(user.profilePicture!) as ImageProvider,
                  fit: BoxFit.cover),
            ),
          ),
          Text(
            '@${user.username}',
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
