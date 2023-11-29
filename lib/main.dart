import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simpanin/pages/auth/log_in.dart';
import 'package:simpanin/pages/auth/sign_up.dart';
import 'package:simpanin/pages/misc/onboarding.dart';
import 'package:simpanin/pages/misc/splash.dart';
import 'package:simpanin/pages/profile/profile.dart';
import 'package:simpanin/firebase_options.dart';
import 'package:simpanin/pages/staff/mailbox/mailbox_create.dart';
import 'package:simpanin/pages/staff/mailbox/mailbox_detail.dart';
import 'package:simpanin/pages/staff/mailbox/mailbox_edit.dart';
import 'package:simpanin/pages/staff/mailbox/mailbox_list.dart';
import 'package:simpanin/pages/user/mailbox/mailbox_detail.dart';
import 'package:simpanin/pages/user/mailbox/mailbox_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueGrey,
              background: Colors.white,
              brightness: Brightness.light,
              primary: const Color(0xFFF16807),
              secondary: const Color(0xFF1A1A1A),
              tertiary: const Color(0xFFF796AB),
              error: Colors.white,
              onBackground: Colors.white,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
            ),
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.copyWith(
                  displayLarge: const TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                  displaySmall:
                      const TextStyle(color: Colors.white, fontSize: 16),
                  displayMedium: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                  bodyMedium: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  titleMedium: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                  bodySmall: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  )),
            ),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)))),
        home: const UserMailboxDetailScreen(),
        builder: EasyLoading.init());
  }
}
