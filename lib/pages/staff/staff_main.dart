import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:simpanin/pages/profile/profile.dart';
import 'package:simpanin/pages/staff/home.dart';
import 'package:simpanin/pages/staff/mailbox/mailbox_list.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_list.dart';
import 'package:simpanin/pages/staff/payment/payment_list.dart';

class StaffMainScreen extends StatefulWidget {
  const StaffMainScreen({Key? key}) : super(key: key);
  @override
  _StaffMainScreenState createState() => _StaffMainScreenState();
}

class _StaffMainScreenState extends State<StaffMainScreen> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    const StaffHomeScreen(),
    const StaffMailboxListScreen(),
    const StaffMaintenanceListScreen(),
    const StaffPaymentListScreen(),
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
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        color: const Color(0xFFFAFAFA),
        child: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: (i) => setState(() => _selectedIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.home),
              title: const Text("Home"),
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
              icon: const Icon(Iconsax.broom),
              title: const Text("Maint."),
              selectedColor: Theme.of(context).colorScheme.primary,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.send),
              title: const Text("Pemb."),
              selectedColor: Theme.of(context).colorScheme.primary,
            ),
            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.user),
              title: const Text("Profile"),
              selectedColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
