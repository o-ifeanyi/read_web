import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:read_web/firebase_options.dart';
import 'package:read_web/screens/home_screen.dart';
import 'package:read_web/screens/privacy_screen.dart';
import 'package:read_web/screens/terms_screen.dart';
import 'package:read_web/theme/colors.dart';
import 'package:read_web/util/config.dart';
import 'package:read_web/util/context_utils.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlexThemeData.dark(
        colorScheme: flexSchemeDark,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: 'Sora',
        textTheme: Config.textTheme,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/privacy': (context) => const PrivacyScreen(),
        '/terms': (context) => const TermsScreen(),
      },
      builder: (context, child) {
        return Container(
          width: context.screenSize.width,
          color: context.theme.scaffoldBackgroundColor,
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: child,
          ),
        );
      },
    );
  }
}
