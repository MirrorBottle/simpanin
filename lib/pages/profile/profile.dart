import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'package:iconsax/iconsax.dart';
import 'package:quickalert/quickalert.dart';
import 'package:simpanin/pages/auth/log_in.dart';
import 'package:simpanin/pages/profile/profile_edit.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'profile_faq.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  final _scrollController = ScrollController();

  void _handleLogout() {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        text: 'Ingin logout akunmu?',
        title: 'Yakin?',
        confirmBtnText: 'Ya',
        cancelBtnText: 'Nggak',
        confirmBtnColor: Theme.of(context).colorScheme.primary,
        onConfirmBtnTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('isLogin');
          prefs.remove('auth');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LogInScreen()),
              (Route<dynamic> route) => false);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFeFeFeF),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            ListTile(
              leading: Icon(
                Iconsax.profile_circle,
                color: Theme.of(context).colorScheme.secondary,
                size: 65,
              ),
              title: Text(
                "Ananta Yusra",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              subtitle: Text("Anantayusra01@gmail.com",
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 30),
            Container(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 160),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32)),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileEditScreen()),
                        );
                      },
                      leading: const Icon(
                        Iconsax.edit,
                        color: Color(0xFFF16807),
                        size: 32,
                      ),
                      title: Text("Edit Profil",
                          style: Theme.of(context).textTheme.labelLarge),
                      subtitle: Text("Perbarui informasi tentang anda",
                          style: Theme.of(context).textTheme.labelSmall),
                      trailing: const Icon(
                        Iconsax.arrow_right,
                        color: Color.fromARGB(255, 32, 23, 23),
                        size: 22,
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 0.8,
                      indent: 65,
                      endIndent: 25,
                      color: Color.fromARGB(96, 72, 72, 72),
                    ),
                    SwitchListTile(
                      value: false,
                      onChanged: (val) {},
                      secondary: const Icon(
                        Iconsax.moon,
                        color: Color(0xFFF16807),
                        size: 32,
                      ),
                      title: Text("Tema Gelap",
                          style: Theme.of(context).textTheme.labelLarge),
                      subtitle: Text("Ubah tema sesuai selera anda",
                          style: Theme.of(context).textTheme.labelSmall),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 0.8,
                      indent: 65,
                      endIndent: 25,
                      color: Color.fromARGB(96, 72, 72, 72),
                    ),
                    ListTile(
                      leading: const Icon(
                        Iconsax.info_circle,
                        color: Color(0xFFF16807),
                        size: 32,
                      ),
                      title: Text("FAQs",
                          style: Theme.of(context).textTheme.labelLarge),
                      subtitle: Text("Temukan bantuan & dukungan",
                          style: Theme.of(context).textTheme.labelSmall),
                      trailing: const Icon(
                        Iconsax.arrow_right,
                        color: Color.fromARGB(255, 32, 23, 23),
                        size: 22,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileFaqScreen()),
                        );
                      },
                    ),
                    const Divider(
                      height: 10,
                      thickness: 0.8,
                      indent: 65,
                      endIndent: 25,
                      color: Color.fromARGB(96, 72, 72, 72),
                    ),
                    ListTile(
                      leading: const Icon(
                        Iconsax.message_question,
                        color: Color(0xFFF16807),
                        size: 32,
                      ),
                      title: Text("Tentang",
                          style: Theme.of(context).textTheme.labelLarge),
                      subtitle: Text("Cari tahu tentang kami",
                          style: Theme.of(context).textTheme.labelSmall),
                      trailing: const Icon(
                        Iconsax.arrow_right,
                        color: Color.fromARGB(255, 32, 23, 23),
                        size: 22,
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Tentang Kami"),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Versi: 1.0",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Simpanin merupakan sebuah aplikasi yang menyediakan jasa penyewaan loker secara online.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Tutup"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    const Divider(
                      height: 10,
                      thickness: 0.8,
                      indent: 65,
                      endIndent: 25,
                      color: Color.fromARGB(96, 72, 72, 72),
                    ),
                    ListTile(
                      onTap: _handleLogout,
                      leading: const Icon(
                        Iconsax.logout_1,
                        color: Color(0xFFF16807),
                        size: 32,
                      ),
                      title: Text("Keluar",
                          style: Theme.of(context).textTheme.labelLarge),
                      subtitle: Text("Sampai jumpa di lain waktu...",
                          style: Theme.of(context).textTheme.labelSmall),
                      trailing: const Icon(
                        Iconsax.arrow_right,
                        color: Color.fromARGB(255, 32, 23, 23),
                        size: 22,
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 0.8,
                      indent: 65,
                      endIndent: 25,
                      color: Color.fromARGB(96, 72, 72, 72),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
