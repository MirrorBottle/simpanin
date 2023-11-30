import 'package:flutter/material.dart';
import 'package:simpanin/components/button_component.dart';

class UserMailboxDetailScreen extends StatefulWidget {
  const UserMailboxDetailScreen({super.key});

  @override
  State<UserMailboxDetailScreen> createState() => _UserMailboxDetailScreenState();
}

class _UserMailboxDetailScreenState extends State<UserMailboxDetailScreen> {
  bool loading = false;
  
  void _handleUbah() async {
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
                top: 60.0, left: 30.0, right: 30.0, bottom: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'A-1',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Sesuaikan dengan radius sudut yang diinginkan
                    color: Colors.white, // Sesuaikan dengan warna yang diinginkan
                  ),
                  child: Center(
                    child: Text(
                      "Tersedia",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 10),
                    ),
                  ),
                )

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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Informasi Mailbox",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0), // Tambahkan padding sebelah kiri dan kanan ke seluruh Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Harga',  style: Theme.of(context).textTheme.titleMedium),
                        Text('Rp. xxx.xxx.xxx', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0), // Tambahkan padding sebelah kiri dan kanan ke seluruh Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ukuran',  style: Theme.of(context).textTheme.titleMedium),
                        Text('xx M', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0), // Tambahkan padding sebelah kiri dan kanan ke seluruh Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tgl. Maintenance',  style: Theme.of(context).textTheme.titleMedium),
                        Text('xx xx xxxxx', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Informasi Pemilik",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0), // Tambahkan padding sebelah kiri dan kanan ke seluruh Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nama',  style: Theme.of(context).textTheme.titleMedium),
                        Text('Awan', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0), // Tambahkan padding sebelah kiri dan kanan ke seluruh Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('No. HP',  style: Theme.of(context).textTheme.titleMedium),
                        Text('08xxxxxxxxxx', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0), // Tambahkan padding sebelah kiri dan kanan ke seluruh Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pemb. Terakhir',  style: Theme.of(context).textTheme.titleMedium),
                        Text('xx xx xxxx', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ButtonComponent(
            loading: loading,
            buttontext: "Ubah Data",
            onPressed: _handleUbah,
          ),
        ],
      ),
    );
  }
}