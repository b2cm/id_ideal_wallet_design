import 'package:flutter/material.dart';
import 'package:id_wallet_design/id_wallet_design.dart';

class ReceiveSats extends StatefulWidget {
  const ReceiveSats({super.key});

  @override
  State<ReceiveSats> createState() => _ReceiveSatsState();
}

class _ReceiveSatsState extends State<ReceiveSats> {
  final List<bool> _selectedReceiveOption = <bool>[true, false];

  // textfield values
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StyledScaffoldTitle(
      title: "Geld empfangen",
      scanOnTap: () => print("tapped scan"),
      // child: const Center(child: Text("hi")));
      // child: a container with one numeric input for an amount, a text field for a memo and a button to generate the QR code
      // child: full height container

      child: TopUp(onTopUpSats: (amount, memo) {
        showModalBottomSheet<dynamic>(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            context: context,
            builder: (context) {
              return InvoiceDisplay(
                invoice:
                    "lnbc10m1p3hna93pp5849agpqfq0r9mhta9y888ukfnht4fdpdktky5n2wjz8nr4hvg0esdqqcqzpgxqrrsssp54yp8hche0r3zhtnatej6jmk50df4krg7mvnkr9uj4xasjkm28hfs9qyyssq4ull5d98xxvadtn7h8emssymchpmp2kjnkp9vpy2ce0e8jup5hukj4ry63kn3gtpzsyenxy0f2ty77xez3vf2fwta4azdg8xg5w4usgqn5wl9j",
                amount: CurrencyDisplay(
                    amount: amount.toString(),
                    symbol: 'sats',
                    mainFontSize: 35,
                    centered: true),
                memo: memo,
              );
            });
      }, onTopUpFiat: (amount) {
        print("charge $amount fiats to card");
      }),
    );
  }
}
