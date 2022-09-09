import 'dart:convert';

import 'package:bakurubey_tharujama/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'style_elements.dart';

class BookmarkedAyahPage extends StatefulWidget {
  const BookmarkedAyahPage(
      {Key? key, required String ayahNumber, required String surahNumber})
      : _ayahNumber = ayahNumber,
        _surahNumber = surahNumber,
        super(key: key);

  final String _ayahNumber;
  final String _surahNumber;

  @override
  State<BookmarkedAyahPage> createState() => _BookmarkedAyahPageState();
}

class _BookmarkedAyahPageState extends State<BookmarkedAyahPage> {
  List<dynamic> _aayaat = [];
  PreferencesService preferencesService = PreferencesService();

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/surah_table.json');
    List<dynamic> data = await json.decode(response)[widget._surahNumber];
//    Map<String, dynamic> map = await json.decode(response);
    //  List<dynamic> data = map[widget.surahNumber];
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
            "",
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: cardShowInsets,
                        child: Text(
                          _aayaat[int.parse(widget._ayahNumber) - 1]["ayah"] ??
                              "",
                          style: ayahTextStyle,
                        ),
                      ),
                      Padding(
                        padding: cardShowInsets,
                        child: Text(
                          "",
                          style: translationTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
