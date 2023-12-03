import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simpanin/components/button_component.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({super.key});

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Image.asset('assets/img/logo_full.png', height: 60),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking",
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
                child: Center(
                  child: Text("C2",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.primary)),
                ),
              ),
              title: Text("Bayu Setiawan",
                  style: Theme.of(context).textTheme.titleLarge),
              subtitle:
                  Text("22 Nov", style: Theme.of(context).textTheme.bodyLarge),
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
                child: Center(
                  child: Text("C3",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.primary)),
                ),
              ),
              title: Text("Ananta Yusra",
                  style: Theme.of(context).textTheme.titleLarge),
              subtitle:
                  Text("22 Nov", style: Theme.of(context).textTheme.bodyLarge),
              trailing: const Icon(
                Iconsax.arrow_right,
                color: Color.fromARGB(255, 32, 23, 23),
                size: 22,
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
              title: Text("B2", style: Theme.of(context).textTheme.titleLarge),
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
              title: Text("B1", style: Theme.of(context).textTheme.titleLarge),
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
