import 'dart:convert';
import 'package:bakurubey_tharujama/bookmarks_model.dart';
import 'package:bakurubey_tharujama/preferences_service.dart';
import 'package:expandable/expandable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'style_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SurahPage extends StatefulWidget {
  const SurahPage(
      {Key? key, required this.surahNumber, required this.surahName})
      : super(key: key);
  final String surahNumber, surahName;

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  List<dynamic> _aayaat = [];
  String initialLiteralText = "ލަފްޒީ މާނަ ބެއްލެވުމަށް ...";
  bool _isSelected = false;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/surah_table.json');
    List<dynamic> data = await json.decode(response)[widget.surahNumber];
//    Map<String, dynamic> map = await json.decode(response);
    //  List<dynamic> data = map[widget.surahNumber];
    setState(() {
      _aayaat = data;
    });
  }

  void saveBookmark(String ayahNum, String surahNum) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('ayah', ayahNum);
    pref.setString('surahNum', surahNum);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await readJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          scrolledUnderElevation: 10.0,
          elevation: 0.0,
          backgroundColor: bgColor,
          iconTheme: IconThemeData(color: iconColor, size: 20),
          titleTextStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'Waheed',
              fontSize: 25),
          centerTitle: true,
          title: Text(
            widget.surahName,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: pageTitleStyle,
          ),
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  primary: false,
                  itemCount: _aayaat.length,
                  itemBuilder: (context, count) {
                    return GestureDetector(
                      onLongPress: () {
                        debugPrint("long press");
                        saveBookmark(
                            (count + 1).toString(), widget.surahNumber);
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 15.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: cardColor,
                        elevation: 5.0,
                        shadowColor: shadowColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: lightCardColor,
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(18.0),
                                  topLeft: Radius.circular(18.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    const SizedBox(
                                      width: 25.0,
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.surahName,
                                        style: ayahTextStyle.copyWith(
                                            fontSize: 17.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        _aayaat[count]["ayah_number"],
                                        style: ayahTextStyle.copyWith(
                                            fontSize: 17.0),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        // final newBookmark = BookmarksModel(
                                        //   bookmarkedAyah: _aayaat[count]
                                        //       ["ayah"],
                                        //   bookmarkedTranslation: _aayaat[count]
                                        //       ["literary"],
                                        //   bookmarkedLiterary: _aayaat[count]
                                        //       ["translation"],
                                        // );
                                        // debugPrint(newBookmark.toString());
                                        debugPrint(count.toString());
                                        setState(() {
                                          _isSelected = !_isSelected;
                                        });
                                      },
                                      child: Icon(
                                        _isSelected
                                            ? Icons.bookmark_added_rounded
                                            : Icons.bookmark,
                                        size: 17.0,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.0,
                                          ),
                                        ),
                                        primary: lightCardColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: cardShowInsets,
                              child: Text(
                                _aayaat[count]["ayah"],
                                style: ayahTextStyle,
                              ),
                            ),
                            TranslationText(
                                aayaat: _aayaat,
                                counter: count,
                                dhivehiLabel: "އިޖްމާލީ މާނަ",
                                item: "literary"),
                            TranslationText(
                              aayaat: _aayaat,
                              item: "translation",
                              counter: count,
                              dhivehiLabel: "ލަފްޒީ މާނަ",
                            ),
                            const SizedBox(
                              height: 15.0,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TranslationText extends StatelessWidget {
  const TranslationText(
      {Key? key,
      required List aayaat,
      required this.counter,
      required this.dhivehiLabel,
      required this.item})
      : _aayaat = aayaat,
        super(key: key);

  final List _aayaat;
  final int counter;
  final String item;
  final String dhivehiLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ExpandableNotifier(
        child: ScrollOnExpand(
          child: ExpandablePanel(
            theme: const ExpandableThemeData(iconColor: Colors.white70),
            header: Text(
              dhivehiLabel,
              style: translationTextStyle,
            ),
            collapsed: const SizedBox(
              height: 0,
            ),
            expanded: Text(
              _aayaat[counter][item],
              style: translationTextStyle,
            ),
            builder: (_, collapsed, expanded) => Expandable(
              collapsed: collapsed,
              expanded: expanded,
            ),
          ),
        ),
      ),
    );
  }
}

// Future saveBookmark(String ayahNumber, int surahNumber) async {
//   final preferences = await SharedPreferences.getInstance();
//
//   await preferences.setString('ayahNumber', ayahNumber);
//   await preferences.setInt('surahNumber', surahNumber);
// }
