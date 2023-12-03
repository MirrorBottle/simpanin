import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simpanin/models/mailbox.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpanin/pages/user/mailbox/mailbox_detail.dart';

class UserMailboxListScreen extends StatefulWidget {
  const UserMailboxListScreen({super.key});

  @override
  State<UserMailboxListScreen> createState() => _UserMailboxListScreenState();
}

class _UserMailboxListScreenState extends State<UserMailboxListScreen> {
  final db = FirebaseFirestore.instance;

  List<MailboxModel> mailboxItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: StreamBuilder<QuerySnapshot>(
        stream: db
            .collection('mailboxes')
            .where("availability", isEqualTo: true)
            .orderBy("code")
            .snapshots(),
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
                      'Mailbox',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
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
                            MailboxModel mailbox = MailboxModel.fromFirestore(doc);
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserMailboxDetailScreen(
                                                  mailbox: mailbox)),
                                    );
                                  },
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
                                      child: Text(mailbox.code,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  color: Theme.of(context).colorScheme.primary)),
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
                                                Text("Ukuran : ${mailbox.size}",
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
