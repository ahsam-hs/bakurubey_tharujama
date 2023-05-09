import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../copy.dart';
import '../style_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bakurubey_tharujama/translation_text_widget.dart';

class JuzPage extends StatefulWidget {
  const JuzPage({Key? key, required this.juzNumber, required this.juzName})
      : super(key: key);
  final String juzNumber, juzName;

  @override
  State<JuzPage> createState() => _JuzPageState();
}

class _JuzPageState extends State<JuzPage> {
  List<dynamic> _aayaat = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/juz_table.json');
    List<dynamic> data = await json.decode(response)[widget.juzNumber];
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
            widget.juzName,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: deviceOrientation == Orientation.portrait
                ? pageTitleStyle
                : pageTitleStyle.copyWith(fontSize: 30.0),
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
                      elevation: 5.0,
                      shadowColor: shadowColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onLongPress: () => copyData(_aayaat[count]["ayah"],
                                "އާޔަތް ކޮޕީކުރެވިއްޖެ", context),
                            child: Padding(
                              padding: cardShowInsets,
                              child: Text(
                                _aayaat[count]["ayah"],
                                style: deviceOrientation == Orientation.portrait
                                    ? ayahTextStyle
                                    : ayahTextStyle.copyWith(fontSize: 35.0),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onLongPress: () => copyData(
                                _aayaat[count]["translation"],
                                "އިޖްމާލީ މާނަ ކޮޕީކުރެވިއްޖެ",
                                context),
                            child: TranslationText(
                                aayaat: _aayaat,
                                counter: count,
                                dhivehiLabel: "އިޖްމާލީ މާނަ",
                                item: "translation"),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          GestureDetector(
                            onLongPress: () => copyData(
                                _aayaat[count]["literary"],
                                "ލަފްޒީ މާނަ ކޮޕީކުރެވިއްޖެ",
                                context),
                            child: TranslationText(
                                aayaat: _aayaat,
                                counter: count,
                                dhivehiLabel: "ލަފްޒީ މާނަ",
                                item: "literary"),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
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
