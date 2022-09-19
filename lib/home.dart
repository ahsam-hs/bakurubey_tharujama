import 'package:bakurubey_tharujama/screens/search.dart';
import 'package:bakurubey_tharujama/screens/surah_list.dart';
import 'screens/juz_list.dart';
import 'package:flutter/cupertino.dart';
import 'style_elements.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              indicatorPadding: const EdgeInsets.symmetric(vertical: 10.0),
              unselectedLabelColor: Colors.grey[600],
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                color: lightCardColor,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(
                fontFamily: 'Waheed',
                fontSize: 18.0,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 35.0),
              labelColor: Colors.white,
              tabs: const [
                Tab(
                  height: 30,
                  text: 'ސޫރަތްތައް',
                ),
                Tab(
                  text: 'ޖުޒްއުތައް',
                ),
                Tab(
                  icon: Icon(
                    Icons.search_rounded,
                    size: 15.0,
                  ),
                )
              ],
            ),
            scrolledUnderElevation: 10.0,
            elevation: 0.0,
            backgroundColor: bgColor,
            // leading: const Icon(Icons.toggle_off_outlined),
            iconTheme: IconThemeData(color: iconColor, size: 20),
            titleTextStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Midhili',
                fontSize: 25),
            centerTitle: true,
            title: Text(
              title,
            ),
            //
          ),
          body: const TabBarView(
            children: [SurahList(), JuzList(), Search()],
          ),
        ),
      ),
    );
  }
}

class ChoiceCard extends StatefulWidget {
  //Widget visibleView;
  const ChoiceCard({Key? key, required this.choiceName}) : super(key: key);

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
