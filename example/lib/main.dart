import 'package:example/receive-sats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:id_wallet_design/id_wallet_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var idWalletDesignTheme = IdWalletDesignTheme();

    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
      theme: idWalletDesignTheme.theme,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // return InitScreen();

    // return InitScreen(
    //     addCredentialButtonOnTap: () => print('addCredentialButtonOnTap'));

    return StyledScaffoldName(
        name: "Maxi Mustermann",
        nameOnTap: () => print("tapped name"),
        scanOnTap: () => print("tapped scan"),
        child: SingleChildScrollView(
            child: Column(
          children: [
            // a white container with text if too big ellipsis, rounded corners and drop shadow

            ElevatedButton(
              onPressed: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  builder: (context) {
                    return PaymentFinished(
                      headline: "Zahlung fehlgeschlagen",
                      success: false,
                      amount: const CurrencyDisplay(
                          amount: "-1000",
                          symbol: 'sats',
                          mainFontSize: 35,
                          centered: true),
                      additionalInfo: Column(children: const [
                        SizedBox(height: 20),
                        Text("Hier könnte ihre Fehlermeldung stehen.",
                            style: TextStyle(color: Colors.red)),
                      ]),
                    );
                  }),
              child: const Text("Zahlung fehlgeschlagen"),
            ),
            // button that navigates to overview screen

            // elevated button on tap shows modal bottom sheet with close button in the top right
            ElevatedButton(
              onPressed: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  builder: (context) {
                    return ModalDismissWrapper(
                        child: PaymentFinished(
                      headline: "Zahlung fehlgeschlagen",
                      success: false,
                      amount: const CurrencyDisplay(
                          amount: "-1000",
                          symbol: 'sats',
                          mainFontSize: 35,
                          centered: true),
                      additionalInfo: Column(children: const [
                        SizedBox(height: 20),
                        Text("Hier könnte ihre Fehlermeldung stehen.",
                            style: TextStyle(color: Colors.red)),
                      ]),
                    ));
                  }),
              child: const Text("Zahlung erfolgreich"),
            ),

            ElevatedButton(
              onPressed: () => showCupertinoModalPopup(
                  context: context,
                  barrierColor: Colors.white,
                  builder: (context) {
                    return SafeArea(
                        child: Material(
                            child:
                                // rounded corners on the top
                                Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: const Padding(
                                        // padding only left and right
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: CredentialOfferDialog(
                                          credential: IdCard(
                                            cardTitle: "HSMW-Card",
                                            subjectName: "Maxi Mustermann",
                                            subjectImage: AssetImage(
                                                "assets/photo-1554151228-14d9def656e4.jpeg"),
                                            bottomLeftText: Text("Student",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            bottomRightText: Text("44331",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ),
                                          receipt: Receipt(
                                              items: [
                                                ReceiptItem(
                                                  label: "Digitale ID Karte",
                                                  amount: CurrencyDisplay(
                                                    amount: "5 0000",
                                                    symbol: "sat",
                                                  ),
                                                ),
                                                ReceiptItem(
                                                  label: "Ausstellungsgebühr",
                                                  amount: CurrencyDisplay(
                                                    amount: "1000",
                                                    symbol: "sat",
                                                  ),
                                                ),
                                              ],
                                              total: ReceiptItem(
                                                  label: "Gesamt",
                                                  amount: CurrencyDisplay(
                                                      amount: "5 1000",
                                                      symbol: "sat"))),
                                        )))));
                  }),
              child: const Text("Credential anbieten"),
            ),
            Balance(
              receiveOnTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ReceiveSats())),
              sendOnTap: () => print("tapped send"),
              balance: const CurrencyDisplay(
                symbol: "sat",
                amount: "472 069",
                mainFontSize: 40,
              ),
            ),
            Container(
              height: 20,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StyledScaffoldTitle(
                            title: "Zahlungsdetails",
                            scanOnTap: () => print("tapped scan"),
                            child: PaymentDetails(
                              amount: const CurrencyDisplay(
                                symbol: "sat",
                                amount: "-98 847",
                                centered: true,
                                mainFontSize: 30,
                              ),
                              memo: "Trainerroad Rechnung #44994",
                              // datetime from timestamp
                              timestamp: DateTime.fromMillisecondsSinceEpoch(
                                  1620000000000),
                              success: true,
                              additionalInfo: const Receipt(
                                  items: [
                                    ReceiptItem(
                                      label: "Digitale ID Karte",
                                      amount: CurrencyDisplay(
                                        amount: "5 0000",
                                        symbol: "sat",
                                      ),
                                    ),
                                    ReceiptItem(
                                      label: "Ausstellungsgebühr",
                                      amount: CurrencyDisplay(
                                        amount: "1000",
                                        symbol: "sat",
                                      ),
                                    ),
                                  ],
                                  total: ReceiptItem(
                                      label: "Gesamt",
                                      amount: CurrencyDisplay(
                                          amount: "5 1000", symbol: "sat"))),
                            ),
                          ))),
              child: const TransactionPreview(
                  title: "TrainerRoad",
                  amount: CurrencyDisplay(
                    symbol: "sat",
                    amount: "-98 847",
                  )),
            ),
            const TransactionPreview(
                title: "Fiat Top Up",
                amount: CurrencyDisplay(
                  symbol: "sat",
                  amount: "+107 499",
                )),
            const TransactionPreview(
                title: "In-N-Out Burger",
                amount: CurrencyDisplay(
                  symbol: "sat",
                  amount: "-53 038",
                )),
            const Heading(text: "Zeitlich relevant"),
            Shortcut(
                onTap: () => print("tapped shortcut"),
                icon: const AssetImage("assets/truck-fast-regular.png"),
                text: "Zwei Pakete kommen heute an"),
            Container(
              height: 12,
            ),
            Shortcut(
                onTap: () => print("tapped shortcut"),
                icon: const AssetImage("assets/ticket-regular.png"),
                text:
                    "Ticket for hello hello hello hello hello hello darkness my old friend"),
            const Heading(text: "Hub"),
            GridView.count(
                // disable scrolling
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                // no spacing
                mainAxisSpacing: 12,
                crossAxisSpacing: 0,
                // shrink the grid to fit the content
                shrinkWrap: true,
                // children: a list of hub-apps
                children: [
                  HubApp(
                      onTap: () => print("tapped hub app"),
                      icon: const AssetImage("assets/house-crack-regular.png"),
                      label: "Versicherung"),
                  HubApp(
                      onTap: () => print("tapped hub app"),
                      icon: const AssetImage("assets/ticket-regular.png"),
                      label: "Tickets"),
                  HubApp(
                      onTap: () => print("tapped hub app"),
                      icon: const AssetImage("assets/plane-regular.png"),
                      label: "Reisen"),
                  HubApp(
                      onTap: () => print("tapped hub app"),
                      icon: const AssetImage("assets/print-regular.png"),
                      label: "Drucken"),
                ]),
            const IdCard(
              cardTitle: "HSMW-Card",
              subjectName: "Maxi Mustermann",
              subjectImage:
                  AssetImage("assets/photo-1554151228-14d9def656e4.jpeg"),
              bottomLeftText: Text("Student",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              bottomRightText: Text("44331",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ],
        )));
  }
}
