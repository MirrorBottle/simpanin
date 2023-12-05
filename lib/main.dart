import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simpanin/pages/misc/splash.dart';
import 'package:simpanin/firebase_options.dart';
import 'package:simpanin/providers/maintenance_create_provider.dart';
import 'package:simpanin/providers/user_provider.dart';
import 'package:simpanin/providers/mailbox_book_provider.dart';
import 'package:simpanin/providers/theme_mode_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => ThemeModeProvider()),
          ChangeNotifierProvider(
            create: (BuildContext context) => MailboxBookProvider()),
          ChangeNotifierProvider(
            create: (BuildContext context) => UserProvider()),
          ChangeNotifierProvider(
            create: (BuildContext context) => MaintenanceCreateProvider()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Simpanin',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.blueGrey,
                  background: Colors.white,
                  brightness: Brightness.light,
                  primary: const Color(0xFFF16807),
                  secondary: const Color(0xFF1A1A1A),
                  tertiary: const Color(0xFFfef0e6),
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
            home: const SplashScreen(),
            builder: EasyLoading.init()));
  }
}
