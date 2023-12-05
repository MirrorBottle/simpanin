import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simpanin/components/button_component.dart';

import 'package:simpanin/pages/staff/maintenance/maintenance_list.dart';

class StaffMaintenanceEditScreen extends StatefulWidget {

  @override
  State<StaffMaintenanceEditScreen> createState() => _StaffMaintenanceEditScreenState();
}


class _StaffMaintenanceEditScreenState extends State<StaffMaintenanceEditScreen> {
  final _scrollController = ScrollController();
  bool loading = false;

  DateTime _tanggalMulai = DateTime.now();
  DateTime _tanggalSelesai = DateTime.now();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _nomorHPController = TextEditingController();
  TextEditingController _catatanController = TextEditingController();

  @override

  
  void _handleUbah() async {
  setState(() {
    loading = true;
  });
  try {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StaffMaintenanceListScreen(),)
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
                "Edit Maintenance",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF16807),
                      fontSize: 30,
                    ),
              ),
              subtitle: Text(
                "Edit Staff Maintenance",
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
                          3, // Or provide a value greater than 1 as needed
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
                    onPressed: _handleUbah,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pilihTanggal(BuildContext context, bool isStartDate) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _tanggalMulai : _tanggalSelesai,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        if (isStartDate) {
          _tanggalMulai = selectedDate;
        } else {
          _tanggalSelesai = selectedDate;
        }
      });
    }
  }
}
