import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simpanin/models/mailbox.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpanin/pages/staff/mailbox/mailbox_create.dart';
import 'package:simpanin/pages/user/mailbox/mailbox_detail.dart';

class StaffPaymentListScreen extends StatefulWidget {
  const StaffPaymentListScreen({super.key});

  @override
  State<StaffPaymentListScreen> createState() => _StaffPaymentListScreenState();
}

class _StaffPaymentListScreenState extends State<StaffPaymentListScreen> {
  final db = FirebaseFirestore.instance;

  List<MailboxModel> mailboxItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const StaffMailboxCreateScreen()));
        },
        tooltip: 'Tambah',
        label: const Text("Tambah", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('mailboxes').snapshots(),
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    top: 60.0, left: 30.0, right: 30.0, bottom: 60.0),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: snapshot.hasData
                      ? ListView(
                          children: snapshot.data!.docs.map((doc) {
                            MailboxModel mailbox = MailboxModel(
                                id: doc.id,
                                code: doc['code'],
                                price: doc['price'],
                                size: doc['size'],
                                availability: doc['availability']);
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {},
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
                                      child: Text(mailbox.code,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)),
                                    ),
                                  ),
                                  title: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Radius sudut border kotak
                                      ),
                                      child: Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(mailbox.formattedPrice,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium
                                                        ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .secondary)),
                                                const SizedBox(height: 4),
                                                Text("Nov 12",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall)
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                  trailing: Icon(
                                    Iconsax.arrow_right,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 28,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        )
                      : (const Center(
                          child: CircularProgressIndicator(),
                        )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}