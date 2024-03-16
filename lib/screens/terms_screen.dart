import 'package:flutter/material.dart';
import 'package:read_web/util/config.dart';
import 'package:read_web/util/context_utils.dart';
import 'package:read_web/widgets/default_app_bar.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
          Text('Terms of Service', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text("""Last updated: March 15, 2024

Thank you for choosing Read, owned by Ifeanyi Onuoha ("we", "us", "our"). Please read these Terms of Service ("Terms") carefully before using the Read mobile application ("Service"). By accessing or using our Service, you agree to be bound by these Terms."""),
          Config.vGap15,
          Text('Acceptance of Terms', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'By accessing or using our Service, you confirm your agreement to be bound by these Terms. If you do not agree to these Terms, please do not use our Service.'),
          Config.vGap15,
          Text('Changes to Terms', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'We may modify these Terms at any time, and such modifications will be effective immediately upon posting the modified Terms on our Service. You agree to review the Terms periodically to be aware of such modifications and your continued access or use of the Service shall be deemed your conclusive acceptance of the modified Terms.'),
          Config.vGap15,
          Text('Privacy and Data Collection',
              style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'We respect the privacy of our users. We collect telemetry information for the purposes of improving our product for our users. This data is collected through third-party services including Mixpanel. For more information, please refer to our Privacy Policy.'),
          Config.vGap15,
          Text('Limitations of Liability', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'We shall not be responsible or liable for any direct, indirect, incidental, consequential or exemplary losses or damages that may be incurred by you as a result of using our Service, or as a result of any changes, data loss or corruption, cancellation, loss of access, or downtime.'),
          Config.vGap15,
          Text('Termination', style: context.textTheme.titleSmall),
          Config.vGap10,
          const Text(
              'We may terminate or suspend your access to our Service immediately, without prior notice or liability, for any reason, including without limitation if you breach these Terms. All provisions of the Terms which by their nature should survive termination shall survive termination.'),
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
