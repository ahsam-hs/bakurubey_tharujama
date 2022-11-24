import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult(
      {Key? key, required this.resultText, required this.resultStyle})
      : super(key: key);

  final String resultText;
  final TextStyle resultStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        resultText,
        textAlign: TextAlign.start,
        style: resultStyle,
      ),
    );
  }
}
