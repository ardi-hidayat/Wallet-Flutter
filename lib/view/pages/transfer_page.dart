import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/view/widgets/buttons.dart';
import 'package:bank_sha/view/widgets/forms.dart';
import 'package:bank_sha/view/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/view/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          buildRresult(),
          const SizedBox(
            height: 274,
          ),
          CustomeFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

Widget buildRecentUsers() {
  return Container(
    margin: const EdgeInsets.only(top: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Users',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 14,
        ),
        const TransferRecentUserItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Yonna Jie',
            username: 'yoenna',
            isVerified: true),
        const TransferRecentUserItem(
            imageUrl: 'assets/img_friend2.png',
            name: 'John Hi',
            username: 'jhi',
            isVerified: false),
        const TransferRecentUserItem(
            imageUrl: 'assets/img_friend3.png',
            name: 'Masayoshi',
            username: 'form',
            isVerified: false),
      ],
    ),
  );
}

Widget buildRresult() {
  return Container(
    margin: const EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 14,
        ),
        Wrap(
          spacing: 17,
          runSpacing: 17,
          children: const [
            TransferResultUserItem(
              imageUrl: 'assets/img_friend1.png',
              name: 'Yonna Jie',
              username: 'yoenna',
              isVerified: true,
            ),
            TransferResultUserItem(
              imageUrl: 'assets/img_friend4.png',
              name: 'Yonne Ka',
              username: 'yoenyu',
              isVerified: false,
              isSelected: true,
            ),
          ],
        ),
      ],
    ),
  );
}
