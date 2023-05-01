import 'dart:convert';
import 'package:bakurubey_tharujama/style_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bakurubey_tharujama/translation_text_widget.dart';
import 'package:bakurubey_tharujama/copy.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:quran/quran.dart';

class SurahPage extends StatefulWidget {
  const SurahPage(
      {Key? key, required this.surahNumber, required this.surahName})
      : super(key: key);
  final String surahNumber, surahName;

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  final arabicNumbers = ArabicNumbers();
  List<dynamic> _aayaat = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/surah_table.json');
    Map<String, dynamic> map = await json.decode(response);
    List<dynamic> data = map[widget.surahNumber];
    setState(() {
      _aayaat = data;
    });
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
    final deviceOrientation = MediaQuery.of(context).orientation;

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
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: cardColor,
                      elevation: 2.0,
                      shadowColor: shadowColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: cardShowInsets,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    child: Text(
                                      //   _aayaat[count]["ayah"], //"ayah"
                                      int.parse(widget.surahNumber) == 1 ||
                                              int.parse(widget.surahNumber) == 9
                                          ? getVerse(
                                              int.parse(widget.surahNumber),
                                              count + 1)
                                          : count == 0
                                              ? basmala +
                                                  "\n" +
                                                  getVerse(
                                                      int.parse(
                                                          widget.surahNumber),
                                                      count + 1)
                                              : getVerse(
                                                      int.parse(
                                                          widget.surahNumber),
                                                      count + 1) +
                                                  " ",
                                      //    arabicNumbers.convert(count + 1),
                                      style: deviceOrientation ==
                                              Orientation.portrait
                                          ? ayahTextStyle
                                          : ayahTextStyle.copyWith(
                                              fontSize: 38),
                                    ),
                                    onLongPress: () => copyData(
                                        // _aayaat[count]["ayah"],
                                        getVerse(int.parse(widget.surahNumber),
                                            count + 1),
                                        "އާޔަތް ކޮޕީކުރެވިއްޖެ",
                                        context),
                                  ),
                                ),
                                Text(
                                  arabicNumbers.convert(count + 1),
                                  style: TextStyle(
                                    fontFamily: 'Uthmanic',
                                    color: Colors.white,
                                    fontSize: deviceOrientation ==
                                            Orientation.portrait
                                        ? 25.0
                                        : 35.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onLongPress: () => copyData(
                                _aayaat[count]["literary"], // Ijmaalee maana
                                "އިޖްމާލީ މާނަ ކޮޕީކުރެވިއްޖެ",
                                context),
                            child: TranslationText(
                                aayaat: _aayaat,
                                counter: count,
                                dhivehiLabel: "އިޖްމާލީ މާނަ",
                                item: "literary"),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          GestureDetector(
                            onLongPress: () => copyData(
                                _aayaat[count]["translation"], // Lafzee maana
                                "ލަފްޒީ މާނަ ކޮޕީކުރެވިއްޖެ",
                                context),
                            child: TranslationText(
                              aayaat: _aayaat,
                              item: "translation",
                              counter: count,
                              dhivehiLabel: "ލަފްޒީ މާނަ",
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          )
                        ],
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
