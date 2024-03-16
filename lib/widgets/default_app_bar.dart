// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:read_web/util/context_utils.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/read.png',
                height: 40,
              ),
            ),
            Text('ead', style: context.textTheme.displayMedium),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            final emailUrl = Uri(
              scheme: 'mailto',
              path: 'readappeng@gmail.com',
              queryParameters: {
                'subject': 'Read-Support',
              },
            ).toString();

            html.window.open(emailUrl, '_blank');
          },
          icon: const Icon(Icons.mail_rounded),
        ),
      ],
    );
  }
}
