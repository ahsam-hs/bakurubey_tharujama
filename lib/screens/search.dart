import 'dart:convert';
import 'package:bakurubey_tharujama/style_elements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bakurubey_tharujama/lists.dart' as lists;
import 'package:flutter/services.dart';
import 'package:quran/quran.dart';

import '../copy.dart';
import '../search_result_widget.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String selectedSurah = '';
  String? selectedSurahValue;
  String surahNumberText = "";
  String finalAyahText = "";
  String finalTranslationText = "";
  String finalLiteraryText = "";

  String selectedAyah = '';
  String? selectedAyahValue;
  int ayahNumberText = 1;
  String? mappedString;
  List<int> preciseAyahList = [];
  List<String> preciseAyahListString = [];
  int maxAyah = 0;

  String getSelectedSurah() {
    setState(() {
      selectedSurah = surahNumberText;
    });
    return selectedSurah;
  }

  String getSelectedAyah() {
    setState(() {
      selectedAyah = selectedAyahValue ?? "";
    });
    return selectedAyah;
  }

  List<dynamic> _ayah = [];

  Future<void> readJsonData(String surahNumber, int ayahNumber) async {
    try {
      final String response =
          await rootBundle.loadString('assets/surah_table.json');
      Map<String, dynamic> map = await json.decode(response);
      List<dynamic> data = map[surahNumber];
      setState(() {
        _ayah = data;
      });
      finalAyahText = _ayah[ayahNumber]["ayah"];
      finalTranslationText = _ayah[ayahNumber]["literary"];
      finalLiteraryText = _ayah[ayahNumber]["translation"];
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Todo: Dropdown for selection of Surah
                      DropdownButtonHideUnderline(
                        child: StatefulBuilder(
                          builder: (context, setState) => DropdownButton(
                            dropdownColor: cardColor,
                            borderRadius: BorderRadius.circular(18),
                            isExpanded: false,
                            hint: Text(
                              'ސޫރަތް',
                              style: deviceOrientation == Orientation.portrait
                                  ? dropDownNumberTextStyle
                                  : dropDownNumberTextStyle.copyWith(
                                      fontSize: 25.0),
                            ),
                            value: selectedSurahValue,
                            items: lists.surah
                                .map(
                                  (s) => DropdownMenuItem(
                                    value: s,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          s.substring(s.indexOf('س')),
                                          textDirection: TextDirection.rtl,
                                          style: deviceOrientation ==
                                                  Orientation.portrait
                                              ? surahListStyle
                                              : surahListStyle.copyWith(
                                                  fontSize: 30.0),
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? value) {
                              selectedSurahValue =
                                  value; // the name of the surah in the dropdown menu
                              surahNumberText = (lists.surah.indexOf(value!) +
                                      1)
                                  .toString(); // the index of the the surah in the dropdown menu
                              // maxAyah =
                              //     getVerseCount(int.parse(surahNumberText));
                              // preciseAyahList = List<int>.generate(
                              //     maxAyah, (index) => index + 1);
                              // preciseAyahListString = preciseAyahList
                              //     .map((e) => e.toString())
                              //     .toList();
                              // debugPrint(preciseAyahListString.toString());
                              setState(() {
                                value;
                              });
                            },
                          ),
                        ),
                      ),

                      // Todo: Dropdown for selection of Ayah
                      DropdownButtonHideUnderline(
                        child: StatefulBuilder(
                          builder: (context, setState) => DropdownButton(
                            hint: Text(
                              ayai,
                              style: deviceOrientation == Orientation.portrait
                                  ? dropDownNumberTextStyle
                                  : dropDownNumberTextStyle.copyWith(
                                      fontSize: 25.0),
                            ),
                            dropdownColor: cardColor,
                            borderRadius: BorderRadius.circular(18),
                            items: lists.ayah
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          e,
                                          textDirection: TextDirection.rtl,
                                          style: deviceOrientation ==
                                                  Orientation.portrait
                                              ? dropDownNumberTextStyle
                                              : dropDownNumberTextStyle
                                                  .copyWith(fontSize: 25.0),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            value: selectedAyahValue,
                            onChanged: (value) {
                              setState(() {
                                selectedAyahValue = value as String;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Flex(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    direction: Axis.horizontal,
                    children: [
                      IconButton(
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          setState(() {
                            try {
                              selectedAyahValue =
                                  (int.parse(selectedAyahValue!) - 1)
                                      .toString();
                              if (int.parse(selectedAyahValue!) <= 0) {
                                HapticFeedback.vibrate();
                                selectedAyahValue = "1";
                                ayahNumberText = int.parse(selectedAyahValue!);
                              } else {
                                ayahNumberText = int.parse(selectedAyahValue!);
                              }
                            } catch (e) {
                              //
                            }
                            readJsonData(
                                getSelectedSurah(), ayahNumberText - 1);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: lightCardColor,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => lightCardColor),
                          shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          setState(() {
                            try {
                              ayahNumberText = int.parse(selectedAyahValue!);
                            } catch (e) {
                              //
                            }
                            readJsonData(
                                getSelectedSurah(), ayahNumberText - 1);
                          });
                        },
                        child: Text(
                          'ހޯދާ',
                          style: TextStyle(
                            fontFamily: 'Waheed',
                            fontSize: deviceOrientation == Orientation.portrait
                                ? 20
                                : 30,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          setState(() {
                            try {
                              selectedAyahValue =
                                  (int.parse(selectedAyahValue!) + 1)
                                      .toString();
                              if (int.parse(selectedAyahValue!) > 286) {
                                selectedAyahValue = "286";
                                HapticFeedback.vibrate();
                                ayahNumberText = int.parse(selectedAyahValue!);
                              } else {
                                ayahNumberText = int.parse(selectedAyahValue!);
                              }
                            } catch (e) {
                              //
                            }
                            readJsonData(
                                getSelectedSurah(), ayahNumberText - 1);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: lightCardColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onLongPress: () => copyData(
                        finalAyahText, "އާޔަތް ކޮޕީކުރެވިއްޖެ", context),
                    child: SearchResult(
                      resultText: finalAyahText,
                      resultStyle: deviceOrientation == Orientation.portrait
                          ? ayahTextStyle
                          : ayahTextStyle.copyWith(fontSize: 45.0),
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () => copyData(finalTranslationText,
                        "އިޖްމާލީ މާނަ ކޮޕީކުރެވިއްޖެ", context),
                    child: SearchResult(
                      resultText: ijmaalee + ": " + finalTranslationText,
                      resultStyle: deviceOrientation == Orientation.portrait
                          ? translationTextStyle
                          : translationTextStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () => copyData(finalLiteraryText,
                        "ލަފްޒީ މާނަ ކޮޕީކުރެވިއްޖެ", context),
                    child: SearchResult(
                      resultText: lafzee + ": " + finalLiteraryText,
                      resultStyle: deviceOrientation == Orientation.portrait
                          ? translationTextStyle
                          : translationTextStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
