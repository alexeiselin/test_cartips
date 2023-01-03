import 'package:flutter/material.dart';
import 'package:test_cartips/options_widget.dart';
import 'package:test_cartips/reusable_card.dart';
import 'mock_implementation.dart';
import 'lang_change_provider.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Мои коды',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(children: [
          const ReusableCard2(),
          const SizedBox(height: 15),
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
                      return const Text('No user data');
                    }
                  })),
          Expanded(
            child: Align(
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
                        onPressed: (){ Localizations.localeOf(context)
                            .languageCode ==
                            'en'
                            ? context.read<LangChangeProvider>().changeLocale('ru')
                            : context.read<LangChangeProvider>().changeLocale('en');},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                      const ReusableCard(
                          color: Colors.deepPurpleAccent, text: 'Мои коды'),
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
          )
        ]),
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
