import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:bakurubey_tharujama/style_elements.dart';
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
                            child: Text(
                              _aayaat[count]["ayah"], //"ayah"
                              style: ayahTextStyle,
                            ),
                          ),
                          TranslationText(
                              aayaat: _aayaat,
                              counter: count,
                              dhivehiLabel: "އިޖްމާލީ މާނަ",
                              item: "literary"),
                          const SizedBox(
                            height: 15.0,
                          ),
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
              style: translationTextStyle.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            collapsed: const SizedBox(
              height: 0,
            ),
            expanded: Text(
              _aayaat[counter][item],
              textAlign: TextAlign.justify,
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
