import 'package:id_wallet_design/id_wallet_design.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails(
      {super.key,
      required this.success,
      required this.amount,
      required this.memo,
      required this.timestamp,
      this.additionalInfo = const SizedBox(height: 0)});

  final bool success;
  final String memo;
  final CurrencyDisplay amount;
  final DateTime timestamp;
  final Widget additionalInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      // all items centered
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        success
            ? const Image(
                image: AssetImage("assets/icons/circle-check-regular.png",
                    package: "id_wallet_design"),
                height: 85,
                width: 85)
            : const Image(
                image: AssetImage("assets/icons/circle-xmark-regular.png",
                    package: "id_wallet_design"),
                height: 85,
                width: 85),
        const SizedBox(height: 20),
        amount,
        const SizedBox(height: 10),
        // text formatted as a paragraph, justified, 10px padding, overflow ellipsis after 10 lines
        memo != ''
            ? Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  memo,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                ),
              )
            : const SizedBox(height: 0),
        const SizedBox(height: 10),
        Text(
          "Eingang am ${timestamp.day}.${timestamp.month}.${timestamp.year}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        additionalInfo,
      ],
    );
  }
}
