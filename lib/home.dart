import 'package:bakurubey_tharujama/contact_button.dart';
import 'package:bakurubey_tharujama/lists.dart';
import 'package:bakurubey_tharujama/screens/manual.dart';
import 'package:bakurubey_tharujama/screens/search.dart';
import 'package:bakurubey_tharujama/screens/surah_list.dart';
import 'package:quran/quran.dart';
import 'screens/juz_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:bakurubey_tharujama/style_elements.dart';
import 'package:flutter/material.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final arabicNumbers = ArabicNumbers();
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            titleTextStyle: TextStyle(
              color: primeColor,
              fontFamily: 'Midhili',
              fontSize:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 20
                      : 29,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: IconButton(
                  icon: Icon(
                    Icons.info,
                    size:
                        deviceOrientation == Orientation.portrait ? 15.0 : 30.0,
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
                                    style: deviceOrientation ==
                                            Orientation.portrait
                                        ? translationTextStyle
                                        : translationTextStyle.copyWith(
                                            fontSize: 24.0),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      ContactButton(
                                        contactName: 'ޙަދީޘްއެމްވީ',
                                        uriString:
                                            'https://hadithmv.github.io/books/quranBakurube',
                                        icon: Icon(
                                          Icons.open_in_new,
                                          size: 30.0,
                                          color: Color(0xff366ab7),
                                        ),
                                      ),
                                      ContactButton(
                                        contactName: "އަޅުގަނޑު",
                                        uriString: 'https://t.me/ahsammmm',
                                        icon: Icon(
                                          Icons.telegram,
                                          size: 30.0,
                                          color: Color(0xff259cd8),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        shape:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    )),
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => buttonColor)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Manual()));
                                    },
                                    child: Text(
                                      "އެޕް ބޭނުންކުރާ ގޮތް",
                                      style: TextStyle(
                                        fontFamily: 'Waheed',
                                        fontSize: deviceOrientation ==
                                                Orientation.portrait
                                            ? 20
                                            : 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
            actionsIconTheme: IconThemeData(
              color: lightCardColor,
              size: 20.0,
            ),
            bottom: TabBar(
              unselectedLabelStyle: TextStyle(
                fontFamily: 'Waheed',
                fontSize:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 16.0
                        : 22.0,
              ),
              labelStyle: TextStyle(
                fontFamily: 'Waheed',
                fontSize:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 18.0
                        : 25.0,
              ),
              isScrollable: true,
              indicatorPadding: EdgeInsets.symmetric(vertical: 10.0),
              tabs: [
                Tab(
                  height: deviceOrientation == Orientation.portrait ? 30 : 50,
                  text: 'ސޫރަތްތައް',
                ),
                Tab(
                  height: deviceOrientation == Orientation.portrait ? 30 : 50,
                  text: 'ޖުޒްއުތައް',
                ),
                Tab(
                  icon: Icon(
                    Icons.search_rounded,
                    size:
                        deviceOrientation == Orientation.portrait ? 15.0 : 24.0,
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
