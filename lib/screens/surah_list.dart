import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../style_elements.dart';
import 'surah.dart';
import 'package:quran/quran.dart' as quran;
import '../lists.dart' as lists;

class SurahList extends StatefulWidget {
  const SurahList({Key? key}) : super(key: key);

  @override
  State<SurahList> createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return ListView.builder(
        itemCount: lists.surah.length,
        itemBuilder: (context, count) {
          String surahName = lists.surah[count].toString();
          return GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return SurahPage(
                    surahNumber: (count + 1).toString(),
                    surahName:
                        lists.surah[count].substring(surahName.indexOf('س')));
              }));
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 25.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              surahName.substring(surahName.indexOf('س')),
                              style: deviceOrientation == Orientation.portrait
                                  ? surahListStyle
                                  : surahListStyle.copyWith(fontSize: 30),
                            ),
                            Text(
                              quran.getVerseCount(count + 1).toString() +
                                  " އާޔަތް",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Waheed',
                                fontSize:
                                    deviceOrientation == Orientation.portrait
                                        ? 15
                                        : 24,
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              lists.surahArabicNumbers[count],
                              style: TextStyle(
                                fontFamily: 'times',
                                color: subTextColor,
                                fontSize:
                                    deviceOrientation == Orientation.portrait
                                        ? 15.0
                                        : 24,
                              ),
                            ),
                            Text(
                              quran.getPlaceOfRevelation(count + 1) == "Makkah"
                                  ? "މައްކީ"
                                  : "މަދަނީ",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Waheed',
                                  fontSize:
                                      deviceOrientation == Orientation.portrait
                                          ? 15.0
                                          : 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
