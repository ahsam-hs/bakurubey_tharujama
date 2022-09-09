import 'package:bakurubey_tharujama/bookmarked_ayah_page.dart';
import 'package:bakurubey_tharujama/surah_list.dart';
import 'package:flutter/services.dart';
import 'bookmarks.dart';
import 'juz_list.dart';
import 'package:flutter/cupertino.dart';
import 'style_elements.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  Widget visibleScreen = SurahList();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          leading: const Icon(Icons.toggle_off_outlined),
          iconTheme: IconThemeData(color: iconColor, size: 20),
          titleTextStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'Waheed',
              fontSize: 25),
          centerTitle: true,
          title: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: SizedBox.expand(
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: SizedBox(
                  height: 50.0,
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            HapticFeedback.mediumImpact();
                            widget.visibleScreen = SurahList();
                          }),
                          child: ChoiceCard(
                            choiceName: "ސޫރަތްތައް",
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            HapticFeedback.mediumImpact();
                            widget.visibleScreen = JuzList();
                          }),
                          child: ChoiceCard(
                            choiceName: "ޖުޒްއުތައް",
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            HapticFeedback.lightImpact();
                            widget.visibleScreen = Bookmarks();
                          }),
                          child: ChoiceCard(
                            choiceName: "ބުކްމާކްތައް",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: widget.visibleScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceCard extends StatefulWidget {
  //Widget visibleView;
  ChoiceCard({Key? key, required this.choiceName}) : super(key: key);

  final String choiceName;

  @override
  State<ChoiceCard> createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> {
  late String choice;
  MyHomePage home = MyHomePage(title: title);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.choiceName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Waheed',
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
