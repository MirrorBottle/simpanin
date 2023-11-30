import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'package:iconsax/iconsax.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simpanin/pages/profile/profile_edit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  final _scrollController = ScrollController();

  Future<dynamic> _handleAboutTap() {
    return showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: const Text("Tentang"),
            content: const SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Versi: 1.0.0",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Asadah merupakan sebuah aplikasi untuk melakukan pengajuan akad secara online oleh Asadah Gadai Syariah.")
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFeFeFeF),
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
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            ListTile(
              leading: const Icon(
                Iconsax.profile_circle,
                color: Color.fromARGB(255, 15, 10, 10),
                size: 65,
              ),
              title: Text(
                "Ananta Yusra",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF16807),
                    ),
              ),
              subtitle: Text("Anantayusra01@gmail.com",
                  style: Theme.of(context).textTheme.titleSmall),
              trailing: const Icon(
                Iconsax.arrow_right,
                color: Color.fromARGB(255, 32, 23, 23),
                size: 28,
              ),
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
                              builder: (context) => ProfileEditScreen()),
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
                    ListTile(
                      leading: const Icon(
                        Iconsax.money_change,
                        color: Color(0xFFF16807),
                        size: 32,
                      ),
                      title: Text("Ganti Tema",
                          style: Theme.of(context).textTheme.labelLarge),
                      subtitle: Text("Ubah tema sesuai selera anda",
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
                    ListTile(
                      leading: const Icon(
                        Iconsax.message_question,
                        color: Color(0xFFF16807),
                        size: 32,
                      ),
                      title: Text("Bantuan",
                          style: Theme.of(context).textTheme.labelLarge),
                      subtitle: Text("Temukan bantuan & dukungan",
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
                    ListTile(
                      leading: const Icon(
                        Iconsax.money,
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
                              title: Text("Tentang Kami"),
                              
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Versi: 1.0",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),),
        
                                  SizedBox(height: 8),
                                  Text(
                                    "Simpanin merupakan sebuah aplikasi yang menyediakan jasa penyewaan loker secara online.",
                                    style: Theme.of(context).textTheme.bodySmall!. copyWith(color: Theme.of(context).colorScheme.secondary ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Tutup"),
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
                      leading: Icon(
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
