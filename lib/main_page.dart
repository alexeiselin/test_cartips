import 'package:flutter/material.dart';
import 'package:test_cartips/options_widget.dart';
import 'package:test_cartips/reusable_card.dart';
import 'mock_implementation.dart';
import 'lang_change_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    cardsFuture = readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text(
                    'Мои коды',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500),
                  ),
                  Badge(
                    position: BadgePosition.topEnd(
                      top: 3,
                      end: 3
                    ),
                    showBadge: true,
                    child: const Icon(
                      size: 36.0,
                      Icons.notifications,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ReusableCard2()),
            const SizedBox(height: 40),
            Expanded(
                child: FutureBuilder<List<ReusableCard>>(
                    future: cardsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData) {
                        final cards = snapshot.data!;
                        return buildCards(cards);
                      } else {
                        return const Text('No data');
                      }
                    })),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          Localizations.localeOf(context).languageCode == 'en'
                              ? context
                                  .read<LangChangeProvider>()
                                  .changeLocale('ru')
                              : context
                                  .read<LangChangeProvider>()
                                  .changeLocale('en');
                        },
                        icon: const Icon(
                          size: 28.0,
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFCDC1FF),
                            borderRadius: BorderRadius.circular(24.0)),
                        height: 48.0,
                        width: 126.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.qr_code,
                              size: 28.0,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              'Мои коды',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        size: 28.0,
                        Icons.person,
                        color: Colors.white,
                      )
                    ],
                  )),
            )
          ]),
        ),
      ),

      // body: Column(
      //   children:  [
      //

      //   ],
      // ),
    );
  }
}

Widget buildCards(List<ReusableCard> cards) => ListView.builder(
      itemBuilder: (context, index) {
        final card = cards[index];
        return card;
      },
      itemCount: cards.length,
    );
