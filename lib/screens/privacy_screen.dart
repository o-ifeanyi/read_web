import 'package:flutter/material.dart';
import 'package:read_web/util/config.dart';
import 'package:read_web/util/context_utils.dart';
import 'package:read_web/widgets/default_app_bar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenSize.width * 0.07,
          vertical: 10,
        ),
        children: [
          const DefaultAppBar(),
          Config.vGap15,
          Text('Privacy Policy', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'At Read, owned by Ifeanyi Onuoha, we value your privacy. This Privacy Policy ("Policy") describes how we collect, use, and share your personal information when you use Read mobile application ("Service"). By using our Service, you agree to the terms of this Policy.'),
          Config.vGap15,
          Text('Information We Collect', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'We collect telemetry information to improve our product for our users. This data includes, but is not limited to, usage patterns, device information, and user interactions within our Service.'),
          Config.vGap15,
          Text('How We Use Your Information',
              style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text("""Your information is used to:

Improve and optimize our Service.
Understand user behavior and preferences.
Address technical issues and provide support."""),
          Config.vGap15,
          Text('Third-Party Services', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'We utilize third-party services to facilitate our data collection and analysis. These third parties include Mixpanel. These services may have their own privacy policies, and we encourage you to review them.'),
          Config.vGap15,
          Text('Security', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'We value your trust in providing us with your information, and we strive to use commercially acceptable means to protect it. However, no method of electronic storage or transmission is 100% secure, so we cannot guarantee absolute security.'),
          Config.vGap15,
          Text('Changes to this Policy', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. Changes are effective once they are posted on this page.'),
          Config.vGap15,
          Text('Contact Us', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text("""
If you have questions or concerns about our Privacy Policy, please contact us at: readappeng@gmail.com

© 2024 Ifeanyi Onuoha. All rights reserved.
"""),
          Config.vGap15,
        ],
      ),
    );
  }
}
