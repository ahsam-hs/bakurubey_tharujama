import 'package:bakurubey_tharujama/style_elements.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends StatelessWidget {
  const ContactButton(
      {Key? key,
      required this.contactName,
      required this.uriString,
      required this.icon})
      : super(key: key);
  final String uriString;
  final String contactName;
  final Icon icon;

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
          icon: icon,
        ),
        Text(
          contactName,
          style: translationTextStyle.copyWith(fontSize: 14.0),
        )
      ],
    );
  }
}
