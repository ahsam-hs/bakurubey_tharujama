import 'package:bakurubey_tharujama/screens/juz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../style_elements.dart';
import '../lists.dart' as lists;

class JuzList extends StatefulWidget {
  const JuzList({Key? key}) : super(key: key);

  @override
  State<JuzList> createState() => _JuzListState();
}

class _JuzListState extends State<JuzList> {
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
                  juzName: lists.juzName[count],
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
                          lists.juzName[count],
                          style: surahListStyle,
                        ),
                        Text(
                          lists.juzArabicNumbers[count],
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
