import 'package:flutter/material.dart';
import 'package:read_web/util/config.dart';
import 'package:read_web/util/context_utils.dart';
import 'package:read_web/widgets/default_app_bar.dart';
import 'package:read_web/widgets/device_area.dart';
import 'package:read_web/widgets/early_access.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenSize.width * 0.07,
            vertical: 15,
          ),
          children: [
            const DefaultAppBar(),
            Config.vGap15,
            RichText(
              text: TextSpan(
                style: context.textTheme.displayMedium
                    ?.copyWith(color: context.colorScheme.primaryContainer),
                text: 'Listen ',
                children: [
                  TextSpan(
                    text: 'to documents, images, texts and websites',
                    style: context.textTheme.displayMedium,
                  ),
                  TextSpan(
                    text: ' effortlessly',
                    style: context.textTheme.displayMedium?.copyWith(
                        color: context.colorScheme.secondaryContainer),
                  ),
                ],
              ),
            ),
            Config.vGap15,
            const EarlyAccess(),
            Config.vGap60,
            const DeviceArea(),
            Config.vGap60,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '© Ifeanyi 2024',
                  style: context.textTheme.bodySmall,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/privacy'),
                  child: Text(
                    'Privacy',
                    style: context.textTheme.bodySmall
                        ?.copyWith(decoration: TextDecoration.underline),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/terms'),
                  child: Text(
                    'Terms',
                    style: context.textTheme.bodySmall
                        ?.copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            Config.vGap15,
          ],
        ),
      ),
    );
  }
}
