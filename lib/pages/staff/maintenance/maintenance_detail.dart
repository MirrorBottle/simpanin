import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpanin/pages/staff/maintenance/maintenance_list.dart';

class StaffMaintenanceDetailScreen extends StatefulWidget {
  final Task task;

  const StaffMaintenanceDetailScreen({Key? key, required this.task})
      : super(key: key);

  @override
  State<StaffMaintenanceDetailScreen> createState() =>
      _StaffMaintenanceDetailScreenState();
}

class _StaffMaintenanceDetailScreenState
    extends State<StaffMaintenanceDetailScreen> {
  final _scrollController = ScrollController();

  DateTime _tanggalMulai = DateTime.now();
  DateTime _tanggalSelesai = DateTime.now();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    if (widget.task != null) {
      setState(() {
        _tanggalMulai = widget.task.tanggalMulai ?? DateTime.now();
        _tanggalSelesai = widget.task.tanggalSelesai ?? DateTime.now();
      });
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
              child: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: Text(
                'Task Detail',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF16807),
                      fontSize: 30,
                    ),
              ),
              subtitle: Text(
                'Staff Information Maintenance ',
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
                minHeight: MediaQuery.of(context).size.height - 160,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ...
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama :',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18,
                                ),
                      ),
                      Text(
                        '${widget.task.nama}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Mulai :',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18,
                                ),
                      ),
                      Text(
                        '${_tanggalMulai != null ? DateFormat('yyyy-MM-dd').format(_tanggalMulai) : "Belum diisi"}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Selesai :',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18,
                                ),
                      ),
                      Text(
                        '${_tanggalSelesai != null ? DateFormat('yyyy-MM-dd').format(_tanggalSelesai) : "Belum diisi"}',
                      style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nomor HP :',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18,
                                ),
                      ),
                      Text(
                        '${widget.task.nomorHP}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Catatan :',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18,
                                ),
                      ),
                      Text(
                        '${widget.task.catatan}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 18,
                                ),
                      ),
                    ],
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
