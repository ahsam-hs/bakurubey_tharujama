import 'package:bakurubey_tharujama/style_elements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bakurubey_tharujama/lists.dart' as lists;
import 'package:flutter/services.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    String? selectedSurahValue;
    String? selectedAyahValue;
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                direction: Axis.vertical,
                children: [
                  DropdownButtonHideUnderline(
                    child: StatefulBuilder(
                      builder: (context, setState) => DropdownButton(
                        dropdownColor: cardColor,
                        borderRadius: BorderRadius.circular(18),
                        isExpanded: true,
                        hint: Text(
                          'ސޫރަތް',
                          style: TextStyle(
                            fontFamily: 'Typewriter',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        value: selectedSurahValue,
                        items: lists.surah
                            .map(
                              (s) => DropdownMenuItem(
                                value: s,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      s,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontFamily: 'Arslan',
                                          color: Colors.white,
                                          fontSize: 22),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (String? value) {
                          selectedSurahValue = value;
                          setState(() {
                            value;
                          });
                        },
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: StatefulBuilder(
                      builder: (context, setState) => DropdownButton(
                        hint: Text(
                          ' އާޔަތް',
                          style: TextStyle(
                            fontFamily: 'Typewriter',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        dropdownColor: cardColor,
                        borderRadius: BorderRadius.circular(18),
                        isExpanded: true,
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
                                      style: TextStyle(
                                          fontFamily: 'Typewriter',
                                          color: Colors.white,
                                          fontSize: 15),
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
                      for (int i = 0; i < 114; i++) {
                        if (lists.surah[i] == selectedSurahValue) {
                          String surahNum = (i + 1).toString();
                        }
                      }
                    },
                    child: Text(
                      'ހޯދާ',
                      style: TextStyle(
                        fontFamily: 'Waheed',
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('hello'),
            ),
          ),
        )
      ],
    );
  }
}
