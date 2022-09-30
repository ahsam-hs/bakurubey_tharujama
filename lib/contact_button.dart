import 'package:bakurubey_tharujama/style_elements.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends StatelessWidget {
  const ContactButton(
      {Key? key, required this.contactName, required this.uriString})
      : super(key: key);
  final String uriString;
  final String contactName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () async {
              Uri url = Uri.parse(uriString);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                throw '';
              }
            },
            icon: Icon(Icons.telegram, size: 30.0, color: telegramColor)),
        Text(
          contactName,
          style: translationTextStyle.copyWith(fontSize: 14.0),
        )
      ],
    );
  }
}
