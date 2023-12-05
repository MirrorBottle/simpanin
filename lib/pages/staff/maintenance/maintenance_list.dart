import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:simpanin/pages/profile/profile.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_create.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_detail.dart';

class StaffMaintenanceListScreen extends StatefulWidget {
  const StaffMaintenanceListScreen({super.key});

  @override
  State<StaffMaintenanceListScreen> createState() =>
      _StaffMaintenanceListScreenState();
}

// class task
class Task {
  final String nama;
  final DateTime deadline;
  final int prioritas;
  final DateTime?
      tanggalMulai; // Tambahkan tanda tanya (?) untuk mengizinkan nilai null
  final DateTime?
      tanggalSelesai; // Tambahkan tanda tanya (?) untuk mengizinkan nilai null
  final String nomorHP;
  final String catatan;
  bool selesai;

  Task({
    required this.nama,
    required this.deadline,
    required this.prioritas,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.nomorHP,
    required this.catatan,
    this.selesai = false,
  });
}

class _StaffMaintenanceListScreenState
    extends State<StaffMaintenanceListScreen> {
  final _scrollController = ScrollController();

  final List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SingleChildScrollView(
        controller: _scrollController,
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 100),
              child: Text("Maintenance",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary)),
            ),
            const SizedBox(height: 35),
            Container(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height - 255),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
                color: Theme.of(context).colorScheme.background,
              ),
              child: Text("test"),
            ),
          ],
        ),
      ),
      // FloatingActionButton dengan label "Tambah"
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigasi ke halaman StaffMaintenanceCreateScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StaffMaintenanceCreateScreen(),
            ),
          ).then((createdTask) {
            // Callback yang dijalankan setelah kembali dari halaman StaffMaintenanceCreateScreen
            if (createdTask != null) {
              // Tambahkan task baru ke daftar tasks
              setState(() {
                tasks.add(createdTask);
              });
            }
          });
        },
        tooltip: 'Tambah',
        label: const Text("Tambah", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
