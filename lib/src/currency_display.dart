import 'package:flutter/material.dart';

class CurrencyDisplay extends StatelessWidget {
  const CurrencyDisplay(
      {super.key,
      required this.amount,
      required this.symbol,
      this.mainFontSize = 20,
      this.centered = false});

  final String symbol;
  final String amount;
  final double mainFontSize;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            centered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Text(
            amount,
            style: TextStyle(
              fontSize: mainFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              " $symbol",
              style: TextStyle(
                fontSize: mainFontSize * 0.7,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 86, 86),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
