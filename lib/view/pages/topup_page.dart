import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/view/widgets/bank_item.dart';
import 'package:bank_sha/view/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Ardi Hidayat',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          const BankItem(
            imageUrl: 'assets/img_bank_bca.png',
            title: 'Bank BCA',
            isSelected: true,
          ),
          const BankItem(
              imageUrl: 'assets/img_bank_bni.png', title: 'Bank BNI'),
          const BankItem(
              imageUrl: 'assets/img_bank_mandiri.png', title: 'Bank Mandiri'),
          const BankItem(
              imageUrl: 'assets/img_bank_ocbc.png', title: 'Bank OCBC'),
          const SizedBox(
            height: 12,
          ),
          CustomeFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
