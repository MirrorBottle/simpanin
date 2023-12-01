import 'package:flutter/material.dart';
import 'package:simpanin/components/button_component.dart';

class StaffMailboxDetailScreen extends StatefulWidget {
  const StaffMailboxDetailScreen({super.key});

  @override
  State<StaffMailboxDetailScreen> createState() => _StaffMailboxDetailScreenState();
}

class _StaffMailboxDetailScreenState extends State<StaffMailboxDetailScreen> {
  bool loading = false;
  
  void _handleUbah() async {
  }

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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.only(left: 25.0, right: 30.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'A1',
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