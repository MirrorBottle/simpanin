import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simpanin/components/button_component.dart';
import 'package:simpanin/models/agreement.dart';
import 'package:simpanin/models/payment.dart';
import 'package:simpanin/models/user.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({super.key});

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
  final db = FirebaseFirestore.instance;

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
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: db
                  .collection('payments')
                  .where("is_booking", isEqualTo: true)
                  .orderBy("date", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? SizedBox(
                        height: 100,
                        child: ListView(
                          children: snapshot.data!.docs.map((doc) {
                            return FutureBuilder(
                                future: Future.wait<dynamic>([
                                  doc['agreement'].get(),
                                  doc['mailbox'].get(),
                                ]),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<dynamic>> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text('');
                                  }
                                  final payment = PaymentModel.fromFuture(doc,
                                      snapshot.data![0], snapshot.data![1]);
                                  return FutureBuilder(
                                      future: Future.wait<dynamic>([
                                        snapshot.data![0]['user'].get(),
                                      ]),
                                      builder: (BuildContext ctx,
                                          AsyncSnapshot<List<dynamic>>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Text('');
                                        }
                                        final user = UserModel.fromFirestore(snapshot.data![0]);
                                        return ListTile(
                                          leading: Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: Alignment.center,
                                            child: Center(
                                              child: Text(payment.mailbox.code,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary)),
                                            ),
                                          ),
                                          title: Text(
                                              user.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                          subtitle: Text(payment.formattedDate,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge),
                                          trailing: const Icon(
                                            Iconsax.arrow_right,
                                            color:
                                                Color.fromARGB(255, 32, 23, 23),
                                            size: 22,
                                          ),
                                        );
                                      });
                                });
                          }).toList(),
                        ),
                      )
                    : (const Center(
                        child: CircularProgressIndicator(),
                      ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
