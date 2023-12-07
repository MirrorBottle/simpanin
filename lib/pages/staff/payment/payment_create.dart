import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simpanin/models/agreement.dart';
import 'package:simpanin/models/user.dart';
import 'package:simpanin/pages/profile/profile.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_create.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpanin/models/maintenance.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_mailbox_list.dart';
import 'package:simpanin/providers/user_provider.dart';

class StaffPaymentCreateScreen extends StatefulWidget {
  const StaffPaymentCreateScreen({super.key});

  @override
  State<StaffPaymentCreateScreen> createState() =>
      _StaffPaymentCreateScreenState();
}

// class task
class _StaffPaymentCreateScreenState
    extends State<StaffPaymentCreateScreen> {
  final _scrollController = ScrollController();
  final db = FirebaseFirestore.instance;
  final StreamController<void> _refreshController = StreamController<void>();

  @override
  void dispose() {
    _refreshController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _clickBottomSheet(MaintenanceModel maintenance) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        return Container(
          height: 120,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: const Icon(Iconsax.trash),
                title: Text(
                  "Hapus",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                onTap: () async {
                  // Panggil metode untuk menghapus data
                  await _deleteMaintenance(maintenance.id);
                  _refreshController.add(null);
                  Navigator.pop(
                      context); // Tutup bottom sheet setelah penghapusan
                },
              ),
            ],
          ),
        );
      },
    );
  }

// Metode untuk menghapus data dari Firebase
  Future<void> _deleteMaintenance(String maintenanceId) async {
    try {
      await db.collection('maintenance').doc(maintenanceId).delete();
      // Jika Anda memerlukan aksi lebih lanjut setelah penghapusan, Anda dapat menambahkannya di sini.
    } catch (e) {
      print("Error deleting maintenance: $e");
      // Handle error jika diperlukan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          scrolledUnderElevation: 0,
          leading: BackButton(
            color: Theme.of(context).colorScheme.primary,
          )),
      body: SingleChildScrollView(
        controller: _scrollController,
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Text("Tambah\nPembayaran",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary)),
            ),
            const SizedBox(height: 35),
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 255),
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
                color: Theme.of(context).colorScheme.background,
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: db
                    .collection("agreements")
                    .where("status", isEqualTo: "active")
                    .snapshots(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? SizedBox(
                          height: 100,
                          child: ListView(
                            children: snapshot.data!.docs.map((doc) {
                              return FutureBuilder(
                                  future: Future.wait<dynamic>([
                                    doc['mailbox'].get(),
                                  ]),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<dynamic>> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('');
                                    }
                                    final agreement = AgreementModel.fromFuture(
                                        doc, snapshot.data![0]);
                                    return FutureBuilder(
                                        future: Future.wait<dynamic>([
                                          doc['user'].get(),
                                        ]),
                                        builder: (BuildContext ctx,
                                            AsyncSnapshot<List<dynamic>>
                                                snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Text('');
                                          }
                                          final user = UserModel.fromFirestore(
                                              snapshot.data![0]);
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
                                                child: Text(
                                                    agreement.mailbox.code,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary)),
                                              ),
                                            ),
                                            title: Text(user.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge),
                                            subtitle: Text(
                                                agreement.formattedStartDate,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge),
                                            trailing: Icon(
                                              Iconsax.arrow_right,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
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
            ),
          ],
        ),
      ),
    );
  }
}
