import 'package:flutter/material.dart';

class UserMailboxListScreen extends StatefulWidget {
  const UserMailboxListScreen({super.key});

  @override
  State<UserMailboxListScreen> createState() => _UserMailboxListScreenState();
}

class _UserMailboxListScreenState extends State<UserMailboxListScreen> {
  
  List<MailboxItem> mailboxItems = [
    MailboxItem(number: 'A-1', name: 'Awan', date: '30 November 2023'),
    MailboxItem(number: 'A-2', name: 'Lana', date: '30 November 2023'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF16807),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF16807),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),
      body: Column(
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
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                  child: ListView.builder(
                    itemCount: mailboxItems.length,
                    itemBuilder: (context, index) {
                      var item = mailboxItems[index];
            
                      return ListTile(
                        title: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFF16807), // Warna border kotak
                              width: 2.0, // Lebar border kotak
                            ),
                            borderRadius: BorderRadius.circular(10.0), // Radius sudut border kotak
                          ),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF16807), // Sesuaikan dengan warna yang diinginkan
                              ),
                              child: Center(
                                child: Text(
                                  item.number,
                                   style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white)
                                ),
                              ),
                            ),
            
                            const SizedBox(width: 10),
            
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
                                  ),
                            
                                  Text(
                                    "Tgl. Pembayaran : ${item.date}",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 10.5)
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MailboxItem {
  final String number;
  final String name;
  final String date;

  MailboxItem({required this.number, required this.name, required this.date});
}