import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: loggedIn
          ? const Text('خوش آمدید 👋', style: TextStyle(fontSize: 22))
          : Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(decoration: InputDecoration(labelText: 'نام کاربری')),
            const TextField(
              decoration: InputDecoration(labelText: 'رمز عبور'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  loggedIn = true;
                });
              },
              child: const Text('ورود'),
            )
          ],
        ),
      ),
    );
  }
}
