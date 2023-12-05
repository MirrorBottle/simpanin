import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpanin/components/button_component.dart';
import 'package:simpanin/models/user.dart';
import 'package:simpanin/pages/profile/profile.dart';
import 'package:simpanin/providers/user_provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  bool loading = false;
  static final db = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    UserModel user = Provider.of<UserProvider>(context, listen: false).user;
    _nameController.text = user.name;
    _phoneController.text = user.phone;
    _addressController.text = user.address;
  }

  void _handleSubmit() async {
    setState(() {
      loading = true;
    });

    try {
      UserModel user = Provider.of<UserProvider>(context, listen: false).user;
      db.collection("users").doc(user.id).update({
        'name': _nameController.text,
        'phone': _phoneController.text,
        'address': _addressController.text,
      }).then((userRef) async {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.success(
            message: "Mailbox Berhasil Diubah!",
          ),
        );
        setState(() {
          loading = false;
        });
      });
    } catch (e) {
      print(e);
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Terjadi Kesalahan!",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 18.0, bottom: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              title: Text(
                'Edit Profile',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF16807),
                      fontSize: 30,
                    ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 147),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Nama",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: "Boleh kasih tahu namamu?",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "No HP",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "Masukkan emailmu...",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Alamat",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _addressController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: const InputDecoration(
                      hintText: "Masukkan alamatmu...",
                    ),
                  ),
                  const SizedBox(height: 60),
                  ButtonComponent(
                    loading: loading,
                    buttontext: "Ubah Profil",
                    onPressed: _handleSubmit,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
