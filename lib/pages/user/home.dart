import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simpanin/components/button_component.dart';
import 'package:unicons/unicons.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Image.asset('assets/img/logo_full.png', height: 60),
        actions: [
          Chip(
            padding: const EdgeInsets.all(5),
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            label: const Text("Hi, Bayu Setiawan",
                style: TextStyle(color: Colors.white)), //Text
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    "Mailboxmu",
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 160,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 260,
                    height: 160,
                    child: Card(
                        color: Theme.of(context).colorScheme.tertiary,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                          splashColor: Theme.of(context).colorScheme.background,
                          onTap: () {},
                          child: SizedBox(
                            width: 260,
                            height: 160,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'A-2',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                  Text(
                                    'Rp20.000/bln',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            fontSize: 18,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary
                                                .withOpacity(.7),
                                            fontWeight: FontWeight.w100),
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ukuran",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary
                                                        .withOpacity(.6)),
                                          ),
                                          Text(
                                            "2x2",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Tgl. Pemb.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary
                                                        .withOpacity(.6)),
                                          ),
                                          Text(
                                            "22 Nov",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: Colors.black),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Maintenance",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Lihat Semua",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Iconsax.like_1,
                  color: Color(0xFFF16807),
                  size: 32,
                ),
              ),
              title: Text("A-2", style: Theme.of(context).textTheme.titleLarge),
              subtitle: Text("Done · 22 Nov",
                  style: Theme.of(context).textTheme.bodyLarge),
              trailing: const Icon(
                Iconsax.arrow_right,
                color: Color.fromARGB(255, 32, 23, 23),
                size: 22,
              ),
            ),
            ListTile(
              leading: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Iconsax.clock,
                  color: Color(0xFFF16807),
                  size: 32,
                ),
              ),
              title: Text("A-1", style: Theme.of(context).textTheme.titleLarge),
              subtitle: Text("Pending · 22 Nov",
                  style: Theme.of(context).textTheme.bodyLarge),
              trailing: const Icon(
                Iconsax.arrow_right,
                color: Color.fromARGB(255, 32, 23, 23),
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
