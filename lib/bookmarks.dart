import 'package:bakurubey_tharujama/preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/surah_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bookmarked_ayah_page.dart';
import 'style_elements.dart';

class Bookmarks extends StatefulWidget {
  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  // PreferencesService preferencesService = PreferencesService();
  late String ayahNumber;
  late int surahNumber;

  String? ayah;

  void getBookmark() async {
    final pref = await SharedPreferences.getInstance();
    ayah = pref.getString('ayah');
    print(ayah);
  }
  //
  // void getAyahNumber() async {
  //   final preferences = await SharedPreferences.getInstance();
  //   ayahNumber = preferences.getString('ayahNumber')!;
  // }
  //
  // void getSurahNumber() async {
  //   final preferences = await SharedPreferences.getInstance();
  //   surahNumber = preferences.getInt('surahNumber')!;
  //   print(surahNumber);
  // }

  @override
  void initState() {
    super.initState();
    getBookmark();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              // Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
              //   return BookmarkedAyahPage(
              //     surahNumber: "1",
              //     ayahNumber: '5',
              //   );
              // }));
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
                        Text(
                          '',
                          style: TextStyle(
                            fontFamily: 'Arslan',
                            color: subTextColor,
                            fontSize: 25.0,
                          ),
                        ),
                        // Text(
                        //   preferencesService.getBookmark().toString()[0][1],
                        //   style: TextStyle(
                        //     fontFamily: 'Typewriter',
                        //     color: subTextColor,
                        //     fontSize: 20.0,
                        //   ),
                        // ),
                        // Text(
                        //   preferencesService.getBookmark().toString()[0][2],
                        //   style: TextStyle(
                        //     fontFamily: 'Typewriter',
                        //     color: subTextColor,
                        //     fontSize: 20.0,
                        //   ),
                        // ),
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
