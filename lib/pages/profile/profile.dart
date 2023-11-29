import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'package:iconsax/iconsax.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  final _scrollController = ScrollController();

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
            const SizedBox(height: 70,),
            ListTile(
                    leading: const Icon(Iconsax.profile_circle, color: Color.fromARGB(255, 15, 10, 10), size: 65,),
                    title: Text("Ananta Yusra", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Color(0xFFF16807),),),
                    subtitle: Text("Anantayusra01@gmail.com", style: Theme.of(context).textTheme.titleSmall),
                    trailing: const Icon(Iconsax.arrow_right, color: Color.fromARGB(255, 32, 23, 23), size: 28,),
                  ),
            const SizedBox(height: 10,),
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
                  const SizedBox(height: 20,),
                  ListTile(
                    leading: const Icon(Iconsax.wallet, color: Color(0xFFF16807), size: 32,),
                    title: Text("My Wallet", style: Theme.of(context).textTheme.labelLarge),
                    subtitle: Text("See your balance", style: Theme.of(context).textTheme.labelSmall),
                    trailing: const Icon(Iconsax.arrow_right, color: Color.fromARGB(255, 32, 23, 23), size: 22,),
                  ),
                    const Divider(
                    height: 10,
                    thickness: 0.8,
                    indent: 65,
                    endIndent: 25,
                    color: Color.fromARGB(96, 72, 72, 72),
                  ),
                  ListTile(
                    leading: const Icon(Iconsax.translate, color: Color(0xFFF16807), size: 32,),
                    title: Text("Change Languange", style: Theme.of(context).textTheme.labelLarge),
                    subtitle: Text("Change current languange", style: Theme.of(context).textTheme.labelSmall),
                    trailing: const Icon(Iconsax.arrow_right, color: Color.fromARGB(255, 32, 23, 23), size: 22,),
                  ),
                    const Divider(
                    height: 10,
                    thickness: 0.8,
                    indent: 65,
                    endIndent: 25,
                    color: Color.fromARGB(96, 72, 72, 72),
                  ),
                  ListTile(
                    leading: const Icon(Iconsax.message_question, color: Color(0xFFF16807), size: 32,),
                    title: Text("Help", style: Theme.of(context).textTheme.labelLarge),
                    subtitle: Text("Find some help & support", style: Theme.of(context).textTheme.labelSmall),
                    trailing: const Icon(Iconsax.arrow_right, color: Color.fromARGB(255, 32, 23, 23), size: 22,),
                  ),
                    const Divider(
                    height: 10,
                    thickness: 0.8,
                    indent: 65,
                    endIndent: 25,
                    color: Color.fromARGB(96, 72, 72, 72),
                  ),
                  ListTile(
                    leading: Icon(Iconsax.logout_1, color: Color(0xFFF16807), size: 32,),
                    title: Text("Logout", style: Theme.of(context).textTheme.labelLarge),
                    subtitle: Text("Hope to see you soon, then...", style: Theme.of(context).textTheme.labelSmall),
                    trailing: const Icon(Iconsax.arrow_right, color: Color.fromARGB(255, 32, 23, 23), size: 22,),
                  ),
                    const Divider(
                    height: 10,
                    thickness: 0.8,
                    indent: 65,
                    endIndent: 25,
                    color: Color.fromARGB(96, 72, 72, 72),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
