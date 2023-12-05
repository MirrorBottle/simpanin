import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:simpanin/models/mailbox.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpanin/models/payment.dart';
import 'package:simpanin/models/user.dart';
import 'package:simpanin/pages/staff/mailbox/mailbox_create.dart';
import 'package:simpanin/pages/user/mailbox/mailbox_detail.dart';
import 'package:simpanin/providers/user_provider.dart';

class StaffPaymentListScreen extends StatefulWidget {
  const StaffPaymentListScreen({super.key});

  @override
  State<StaffPaymentListScreen> createState() => _StaffPaymentListScreenState();
}

class _StaffPaymentListScreenState extends State<StaffPaymentListScreen> {
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, bottom: 40.0, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Pembayaran',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: db
                    .collection('payments')
                    .orderBy("date", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? ListView(
                          children: snapshot.data!.docs.map((doc) {
                            return FutureBuilder(
                                future: Future.wait<dynamic>([
                                  doc['agreement'].get(),
                                  doc['mailbox'].get()
                                ]),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<dynamic>> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text('');
                                  }
                                  final payment = PaymentModel.fromFuture(doc,
                                      snapshot.data![0], snapshot.data![1]);
                                  return ListTile(
                                    leading: Container(
                                      height: 60,
                                      width: 60,
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
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary)),
                                      ),
                                    ),
                                    title: Text(payment.formattedAmount,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                    subtitle: Text(payment.formattedDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(color: Colors.grey)),
                                  );
                                });
                          }).toList(),
                        )
                      : (const Center(
                          child: CircularProgressIndicator(),
                        ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
