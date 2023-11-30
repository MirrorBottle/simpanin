import 'package:flutter/material.dart';
import 'package:simpanin/components/button_component.dart';
import 'package:simpanin/models/user.dart';
import 'package:simpanin/pages/profile/profile.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {}

  void _handleSubmit() async {
    setState(() {
      loading = true;
    });
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
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
              title: Text(
                'Edit Profile',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF16807),
                      fontSize: 30,
                    ),
              ),
              subtitle: Text(
                'Edit Your Profile Here',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
              ),
            ),
            
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 347),
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
                    "Full Name",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      hintText: "Boleh kasih tahu namamu?",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Email",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Masukkan emailmu...",
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Masukkan emailmu...",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "passs",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Masukkan emailmu...",
                    ),
                  ),
                  const SizedBox(height: 40),
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
