import 'package:bakurubey_tharujama/contact_button.dart';
import 'package:bakurubey_tharujama/lists.dart';
import 'package:bakurubey_tharujama/screens/search.dart';
import 'package:bakurubey_tharujama/screens/surah_list.dart';
import 'screens/juz_list.dart';
import 'package:flutter/cupertino.dart';
import 'style_elements.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: IconButton(
                  icon: Icon(
                    Icons.info,
                    size: 15.0,
                  ),
                  onPressed: () {
                    showDialog(
                        context: (context),
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: cardColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            content: Directionality(
                              textDirection: TextDirection.rtl,
                              child: SizedBox(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Text(
                                      'މި ތަރުޖަމާއަކީ...',
                                      style: pageTitleStyle.copyWith(
                                          color: buttonColor,
                                          fontFamily: 'Midhili'),
                                    ),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    Text(
                                      tributeText,
                                      style: translationTextStyle,
                                      textAlign: TextAlign.justify,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        ContactButton(
                                            contactName: 'ޙަދީޘް އެމް ވީ',
                                            uriString:
                                                'https://t.me/ashraafmv'),
                                        ContactButton(
                                            contactName: "އަޅުގަނޑު",
                                            uriString: 'https://t.me/ahsammmm'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
            actionsIconTheme: IconThemeData(
              color: lightCardColor,
              size: 20.0,
            ),
            bottom: const TabBar(
              isScrollable: true,
              indicatorPadding: EdgeInsets.symmetric(vertical: 10.0),
              tabs: [
                Tab(
                  height: 30,
                  text: 'ސޫރަތްތައް',
                ),
                Tab(
                  text: 'ޖުޒްއުތައް',
                ),
                Tab(
                  icon: Icon(
                    Icons.search_rounded,
                    size: 15.0,
                  ),
                )
              ],
            ),
            title: Text(
              title,
            ),
          ),
          body: const TabBarView(
            children: [SurahList(), JuzList(), Search()],
          ),
        ),
      ),
    );
  }
}
