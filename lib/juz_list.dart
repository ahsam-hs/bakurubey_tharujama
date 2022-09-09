import 'package:bakurubey_tharujama/juz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'style_elements.dart';

class JuzList extends StatefulWidget {
  const JuzList({Key? key}) : super(key: key);

  @override
  State<JuzList> createState() => _JuzListState();
}

class _JuzListState extends State<JuzList> {
  List _juzName = [
    "آلم",
    "سيقول السفهاء",
    "تلك الرسل",
    "لن تنالوا",
    "والمحصنات",
    "لا يحب الله",
    "وإذا سمعوا",
    "ولو أننا",
    "قال الملأ",
    "واعلموا",
    "يعتذرون",
    "ومامن دابة",
    "وما أبرئ",
    "ربما",
    "سبحٰن الذي",
    "قال ألم",
    "اقترب للناس",
    "قد أفلح",
    "وقال الذين",
    "امن خلق",
    "اتل مآ اوحي",
    "ومن يقنت",
    "ومالي",
    "فمن أظلم",
    "فمن أظلم",
    "حـم",
    "قال فما خطبكم",
    "قد سمع الله",
    "تبارك الذي",
    "عم",
  ];

  List<String> arabicNumbers = [
    '١',
    '٢',
    '٣',
    '٤',
    '٥',
    '٦',
    '٧',
    '٨',
    '٩',
    '١٠',
    '١١',
    '١٢',
    '١٣',
    '١٤',
    '١٥',
    '١٦',
    '١٧',
    '١٨',
    '١٩',
    '٢٠',
    '٢١',
    '٢٢',
    '٢٣',
    '٢٤',
    '٢٥',
    '٢٦',
    '٢٧',
    '٢٨',
    '٢٩',
    '٣٠'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, count) {
          return GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return JuzPage(
                  juzNumber: (count + 1).toString(),
                  juzName: _juzName[count],
                );
              }));
            },
            child: Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
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
                        Text(
                          _juzName[count],
                          style: TextStyle(
                            fontFamily: 'Arslan',
                            color: subTextColor,
                            fontSize: 25.0,
                          ),
                        ),
                        Text(
                          arabicNumbers[count],
                          style: TextStyle(
                            fontFamily: 'times',
                            color: subTextColor,
                            fontSize: 20.0,
                          ),
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
