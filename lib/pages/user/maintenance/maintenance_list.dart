import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:simpanin/models/mailbox.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpanin/models/maintenance.dart';
import 'package:simpanin/models/user.dart';
import 'package:simpanin/pages/user/mailbox/mailbox_detail.dart';
import 'package:simpanin/providers/user_provider.dart';

class UserMaintenanceListScreen extends StatefulWidget {
  const UserMaintenanceListScreen({super.key});

  @override
  State<UserMaintenanceListScreen> createState() =>
      _UserMaintenanceListScreenState();
}

class _UserMaintenanceListScreenState extends State<UserMaintenanceListScreen> {
  final db = FirebaseFirestore.instance;
  bool _loading = true;
  final List<DocumentReference> _mailboxes = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    UserModel user = Provider.of<UserProvider>(context, listen: false).user;
    try {
      DocumentReference<Map<String, dynamic>> userRef =
          db.collection('users').doc(user.id);
      QuerySnapshot mailboxQuery = await db
          .collection('agreements')
          .where('user', isEqualTo: userRef)
          .where('status', whereIn: ['active', 'pending']).get();
      await Future.wait(mailboxQuery.docs.map((doc) async {
        _mailboxes.add(doc['mailbox']);
      }));
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('Error fetching mailboxes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: _loading
          ? const Center(child: Text("Loading...."))
          : StreamBuilder<QuerySnapshot>(
              stream: db
                  .collection('maintenances')
                  .where("mailbox", whereIn: _mailboxes)
                  .orderBy("end_date")
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
                            'Maintenance',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 30),
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
                                  return FutureBuilder(
                                      future: doc['mailbox'].get(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<DocumentSnapshot>
                                              mailbox) {
                                        print(mailbox);
                                        if (mailbox.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text('Loading...');
                                        }
                                        final maintenance =
                                            MaintenanceModel.fromFuture(
                                                doc, mailbox.data!);
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
                                            child: Icon(
                                              maintenance.isDone ? Iconsax.like_1 : Iconsax.clock,
                                              color: Color(0xFFF16807),
                                              size: 32,
                                            ),
                                          ),
                                          isThreeLine: true,
                                          title: Text(maintenance.mailbox.code,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge),
                                          subtitle: Text(maintenance.note,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge),
                                          trailing: Text(
                                              "${maintenance.formattedStartDate} ~ ${maintenance.formattedEndDate}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge),
                                        );
                                      });
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
