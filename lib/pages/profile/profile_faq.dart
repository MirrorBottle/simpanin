import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:simpanin/components/button_component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'profile_faq_detail.dart';

class ProfileFaqScreen extends StatefulWidget {
  const ProfileFaqScreen({super.key});

  @override
  State<ProfileFaqScreen> createState() => _ProfileFaqScreenState();
}

class _ProfileFaqScreenState extends State<ProfileFaqScreen> {
  bool loading = false;
  final db = FirebaseFirestore.instance;

  void _handleUbah() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF16807),
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          scrolledUnderElevation: 0,
          leading: const BackButton(
            color: Colors.white,
          )),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('faqs').snapshots(),
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, bottom: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'FAQs',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 10.0,
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
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileFaqDetailScreen(title: doc['title'], content: doc['content'])),
                                  );
                                },
                                title: Text(doc['title'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                trailing: const Icon(
                                  Iconsax.arrow_right,
                                  color: Color.fromARGB(255, 32, 23, 23),
                                  size: 22,
                                ),
                              ),
                              const Divider(
                                height: 10,
                                thickness: 0.8,
                                indent: 65,
                                endIndent: 25,
                                color: Color.fromARGB(96, 72, 72, 72),
                              )
                            ],
                          );
                        }).toList())
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
