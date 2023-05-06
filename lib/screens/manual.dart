import 'package:bakurubey_tharujama/lists.dart';
import 'package:bakurubey_tharujama/style_elements.dart';
import 'package:flutter/material.dart';

class Manual extends StatelessWidget {
  const Manual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text(
            'މި އެޕް ބޭނުންކުރާނެ ގޮތް',
            style: pageTitleStyle.copyWith(
                fontFamily: 'Midhili', color: iconColor),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: Flex(direction: Axis.vertical, children: [
            SizedBox(
              height: 6.0,
            ),
            manualCard(
              deviceOrientation: deviceOrientation,
              manualText: manualText[0],
            ),
            SizedBox(
              height: 6.0,
            ),
            manualCard(
              deviceOrientation: deviceOrientation,
              manualText: manualText[1],
            ),
            SizedBox(
              height: 6.0,
            ),
            manualCard(
              deviceOrientation: deviceOrientation,
              manualText: manualText[2],
            ),
          ]),
        ),
      ),
    );
  }
}

class manualCard extends StatelessWidget {
  const manualCard({
    super.key,
    required this.deviceOrientation,
    required this.manualText,
  });

  final Orientation deviceOrientation;
  final String manualText;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          manualText,
          style: deviceOrientation == Orientation.portrait
              ? translationTextStyle
              : translationTextStyle.copyWith(fontSize: 24.0),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
