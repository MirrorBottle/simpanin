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
  final DateTime? tanggalMulai; // Tambahkan tanda tanya (?) untuk mengizinkan nilai null
  final DateTime? tanggalSelesai; // Tambahkan tanda tanya (?) untuk mengizinkan nilai null
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
    int totalTugas = tasks.length;
    int totalPrioritas1 = tasks.where((task) => task.prioritas == 1).length;
    int totalPrioritas2 = tasks.where((task) => task.prioritas == 2).length;
    int totalPrioritas3 = tasks.where((task) => task.prioritas == 3).length;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFeFeFeF),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
            ),
            ListTile(
              title: Text(
                "Maintenance",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF16807),
                      fontSize: 30,
                    ),
              ),
              subtitle: Text(
                "Staff Maintenance List",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 160),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
                color: Theme.of(context).colorScheme.background,
              ),
              child: ListView.builder(
                // agar menangkap semua element di dalam singelchild untuk dapat di sroll menjadi satu
                shrinkWrap: true,
                // agar tidak perlu mengetuk container di atas listview terlebih dahulu ssebelum bisa di scroll,sehingga seluruh bagian pada halaman bisa di scroll
                physics: const NeverScrollableScrollPhysics(),
                // total jumlah / panjang list
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        onTap: () {
                          // Navigasi ke halaman detail dengan membawa data task
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StaffMaintenanceDetailScreen(
                                      task: tasks[index]),
                            ),
                          );
                        },
                        leading: Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(right: 7),
                          decoration: BoxDecoration(
                            color: tasks[index].prioritas == 1
                                ? Theme.of(context).colorScheme.primary
                                : tasks[index].prioritas == 2
                                    ? const Color.fromARGB(255, 29, 161, 101)
                                    : Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              tasks[index].prioritas == 1
                                  ? Iconsax
                                      .message_time // Ganti dengan ikon prioritas tertinggi
                                  : tasks[index].prioritas == 2
                                      ? Iconsax
                                          .tick_circle // Ganti dengan ikon prioritas sedang
                                      : Iconsax
                                          .receipt_edit, // Ganti dengan ikon prioritas rendah
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text(
                          tasks[index].nama,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Text(
                          DateFormat('yyyy-MM-dd')
                              .format(tasks[index].deadline),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        trailing: const Icon(
                          Iconsax.arrow_right,
                          color: Color.fromARGB(255, 32, 23, 23),
                          size: 22,
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 0.8,
                        indent: 65,
                        endIndent: 0,
                        color: Color.fromARGB(96, 72, 72, 72),
                      ),
                    ],
                  );
                },
              ),
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
