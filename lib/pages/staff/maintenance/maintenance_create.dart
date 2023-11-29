import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpanin/components/button_component.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_detail.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_list.dart';

class StaffMaintenanceCreateScreen extends StatefulWidget {
  @override
  _StaffMaintenanceCreateScreenState createState() =>
      _StaffMaintenanceCreateScreenState();
}

class _StaffMaintenanceCreateScreenState
    extends State<StaffMaintenanceCreateScreen> {
  final _scrollController = ScrollController();
  DateTime _tanggalMulai = DateTime.now();
  DateTime _tanggalSelesai = DateTime.now();
  TextEditingController _namaPelangganController = TextEditingController();
  TextEditingController _nomorHPController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();

  Future<void> _pilihTanggal(BuildContext context, bool isTanggalMulai) async {
    DateTime? tanggalTerpilih = await showDatePicker(
      context: context,
      initialDate: isTanggalMulai ? _tanggalMulai : _tanggalSelesai,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (tanggalTerpilih != null &&
        tanggalTerpilih != (isTanggalMulai ? _tanggalMulai : _tanggalSelesai)) {
      setState(() {
        isTanggalMulai
            ? _tanggalMulai = tanggalTerpilih
            : _tanggalSelesai = tanggalTerpilih;
      });
    }
  }

  bool loading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _tanggalMulai = DateTime.now();
    _tanggalSelesai = DateTime.now();
  }

  void _handleSubmit() async {
    setState(() {
      loading = true;
    });

    try {
      Task task = Task(
        nama: _namaPelangganController.text,
        deadline: _tanggalSelesai,
        prioritas: 1,
        tanggalMulai: _tanggalMulai,
        tanggalSelesai: _tanggalSelesai,
        nomorHP: _nomorHPController.text,
        catatan: _catatanController.text,
      );

      // Pindah ke halaman detail dan kirim objek Task
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StaffMaintenanceDetailScreen(task: task),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(
                        builder: (context) => StaffMaintenanceListScreen()),
                  );
                },
              ),
            ),
            ListTile(
              title: Text(
                "Create Maintenance",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF16807),
                      fontSize: 30,
                    ),
              ),
              subtitle: Text(
                "Creat Staff Maintenance",
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
                minHeight: MediaQuery.of(context).size.height - 175,
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
                color: Theme.of(context).colorScheme.background,
              ),
              child: Column(
                children: [
                  // Tanggal Mulai
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      'Tanggal Mulai    :',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                          ),
                    ),
                    title: ElevatedButton(
                      onPressed: () => _pilihTanggal(context, true),
                      child:
                          Text(DateFormat('dd-MM-yyyy').format(_tanggalMulai)),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Tanggal Selesai
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      'Tanggal Selesai :',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                          ),
                    ),
                    title: ElevatedButton(
                      onPressed: () => _pilihTanggal(context, false),
                      child: Text(
                          DateFormat('dd-MM-yyyy').format(_tanggalSelesai)),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Catatan
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      'Catatan',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: TextField(
                      controller: _catatanController,
                      maxLines:
                          3, // Atau berikan nilai lebih dari 1 sesuai kebutuhan
                      decoration: InputDecoration(labelText: 'Catatan'),
                    ),
                  ),
                  SizedBox(height: 16),
                  const Divider(
                    height: 0,
                    thickness: 0.8,
                    indent: 0,
                    endIndent: 0,
                    color: Color.fromARGB(96, 72, 72, 72),
                  ),
                  SizedBox(height: 16),

                  // Tombol Selesai
                  ButtonComponent(
                    loading: loading,
                    buttontext: "Selesai",
                    onPressed: () {
                      // Mengecek apakah ada input yang kosong
                      if (
                          _catatanController.text.isEmpty) {
                        // Menampilkan pesan peringatan jika ada input yang kosong
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Peringatan'),
                            content: Text(
                              'Semua input harus diisi.',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 241, 7, 7),
                                    fontSize: 18,
                                  ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'OK',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 241, 7, 7),
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Semua input terisi, lanjutkan menyimpan data dan kembali ke layar sebelumnya
                        Task task = Task(
                          nama: _namaPelangganController.text,
                          deadline: _tanggalSelesai,
                          prioritas: 1,
                          tanggalMulai: _tanggalMulai,
                          tanggalSelesai: _tanggalSelesai,
                          nomorHP: _nomorHPController.text,
                          catatan: _catatanController.text,
                        );

                        Navigator.pop(context, task);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
