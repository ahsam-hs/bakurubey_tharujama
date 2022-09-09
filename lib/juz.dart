import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'style_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

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
      print(_aayaat);
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
            widget.juzName,
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
                      elevation: 5.0,
                      shadowColor: shadowColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: cardShowInsets,
                            child: Text(
                              _aayaat[count]["ayah"],
                              style: ayahTextStyle,
                            ),
                          ),
                          Padding(
                            padding: cardShowInsets,
                            child: Text(
                              _aayaat[count]["translation"],
                              style: translationTextStyle,
                            ),
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
