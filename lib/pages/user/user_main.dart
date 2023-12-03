import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:simpanin/pages/profile/profile.dart';
import 'package:simpanin/pages/user/home.dart';
import 'package:simpanin/pages/user/mailbox/mailbox_list.dart';
import 'package:simpanin/pages/user/payment/payment_list.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({Key? key}) : super(key: key);
  @override
  _UserMainScreenState createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    const UserHomeScreen(),
    const UserMailboxListScreen(),
    const UserPaymentListScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabItems[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: const Color(0xFFFAFAFA),
        child: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: (i) => setState(() => _selectedIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.home),
              title: const Text("Beranda"),
              selectedColor: Theme.of(context).colorScheme.primary,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.box),
              title: const Text("Mailbox"),
              selectedColor: Theme.of(context).colorScheme.primary,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.send),
              title: const Text("Pembayaran"),
              selectedColor: Theme.of(context).colorScheme.primary,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.user),
              title: const Text("Profil"),
              selectedColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
