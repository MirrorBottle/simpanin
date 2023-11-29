import 'package:flutter/material.dart';
import 'package:simpanin/components/button_component.dart';

class StaffMailboxCreateScreen extends StatefulWidget {
  const StaffMailboxCreateScreen({super.key});

  @override
  State<StaffMailboxCreateScreen> createState() => _StaffMailboxCreateScreenState();
}

class _StaffMailboxCreateScreenState extends State<StaffMailboxCreateScreen> {
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  List<String> ukuran = ['1 x 1', '2 x 2', '1 x 3'];
  String? _selectedUkuran;

  bool loading = false;

  void _handleTambah() async { 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF16807),
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
                  'Tambah Mailbox',
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
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 210),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
                color: Theme.of(context).colorScheme.background,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                    TextField(
                      controller: _kodeController,
                      decoration: const InputDecoration(
                        labelText: 'Kode',
                        hintText: "Masukkan Kode",
                      ),
                  ),
                  const SizedBox(height: 30),
                    TextField(
                      controller: _hargaController,
                      decoration: const InputDecoration(
                        labelText: 'Harga',
                        hintText: "Masukkan Harga",
                      ),
                  ),
                  const SizedBox(height: 30),
                  DropdownButtonFormField<String>(
                    value: _selectedUkuran,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedUkuran = newValue;
                      });
                    },
                    items: ukuran.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Ukuran',
                    ),
                    isExpanded: true,
                  ),
                  const SizedBox(height: 40),
                  ButtonComponent(
                    loading: loading,
                    buttontext: "Tambah",
                    onPressed: _handleTambah,
                  ),
                ],
              ),
            ), 
          ),
        ],
      ),
    );
  }
}