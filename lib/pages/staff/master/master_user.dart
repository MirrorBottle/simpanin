import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simpanin/models/user.dart';
import 'package:simpanin/pages/profile/profile.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_create.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpanin/models/maintenance.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_mailbox_list.dart';
import 'package:simpanin/providers/user_provider.dart';

class MasterUserListScreen extends StatefulWidget {
  const MasterUserListScreen({super.key});

  @override
  State<MasterUserListScreen> createState() =>
      _MasterUserListScreenState();
}

// class task
class _MasterUserListScreenState
    extends State<MasterUserListScreen> {
  final _scrollController = ScrollController();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        scrolledUnderElevation: 0,
        leading: BackButton(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 100),
              child: Text("Users List",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
            ),
            const SizedBox(height: 35),
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 185),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
                color: Theme.of(context).colorScheme.background,
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: db
                    .collection('users')
                    .orderBy("name")
                    .snapshots(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? SizedBox(
                          height: 100,
                          child: ListView(
                            children: snapshot.data!.docs.map((doc) {
                              return FutureBuilder(
                                  future: doc['users'].get(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot> mailbox) {
                                    if (mailbox.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('');
                                    }
                                    final maintenance =
                                        MaintenanceModel.fromFuture(
                                            doc, mailbox.data!);
                                    return ListTile(
                                      onTap: () {
                                        
                                      },
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
                                        child: Icon(Iconsax.user_octagon,
                                          color: const Color(0xFFF16807),
                                          size: 32,
                                        ),
                                      ),
                                      title: Text(maintenance.mailbox.code,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(maintenance.note,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge)
                                        ],
                                      ),
                                    );
                                  });
                            }).toList(),
                          ),
                        )
                      : (const Center(
                          child: CircularProgressIndicator(),
                        ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
