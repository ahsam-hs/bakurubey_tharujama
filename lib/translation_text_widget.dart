import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'style_elements.dart';

class TranslationText extends StatelessWidget {
  const TranslationText(
      {Key? key,
      required List aayaat,
      required this.counter,
      required this.dhivehiLabel,
      required this.item})
      : _aayaat = aayaat,
        super(key: key);

  final List _aayaat;
  final int counter;
  final String item;
  final String dhivehiLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ExpandableNotifier(
        child: ScrollOnExpand(
          child: ExpandablePanel(
            theme: const ExpandableThemeData(iconColor: Colors.white70),
            header: Text(
              dhivehiLabel,
              style: translationTextStyle.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            collapsed: const SizedBox(
              height: 0,
            ),
            expanded: Text(
              _aayaat[counter][item],
              textAlign: TextAlign.start,
              style: translationTextStyle,
            ),
            builder: (_, collapsed, expanded) => Expandable(
              collapsed: collapsed,
              expanded: expanded,
            ),
          ),
        ),
      ),
    );
  }
}
