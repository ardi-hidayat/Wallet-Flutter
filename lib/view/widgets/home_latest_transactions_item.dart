import 'package:bank_sha/models/response/transaction_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({super.key, required this.transaction});

  // final String iconUrl;
  // final String title;
  // final String time;
  // final String value;

  // const HomeLatestTransactionItem(
  //     {super.key,
  //     required this.iconUrl,
  //     required this.title,
  //     required this.time,
  //     required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(
            'assets/ic_transaction_cat1.png',
            width: 48,
          ),
          // Image.network(
          //   transaction.transactionType!.thumbnail!.toString(),
          //   width: 48,
          // ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  DateFormat('MMM dd')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(transaction.amount ?? 0,
                symbol:
                    transaction.transactionType!.action == 'cr' ? '+ ' : '- '),
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
