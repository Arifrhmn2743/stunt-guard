import 'package:flutter/material.dart';
import 'package:stunting_app/fitur/home/homepage.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("assets/images/logo_app.png"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Deteksi dini, tumbuh kembang optimal",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Aplikasi ini disusun oleh:",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Gita Wulandari",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dengan bimbingan:",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ns. Tina Muzaenah, S.Kep., M.Kep.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/images/Logo_UMP.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Universitas Muhammadiyah Purwokerto, Fakultas Ilmu Kesehatan",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                                foregroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Homepage();
                                }));
                              },
                              child: const Text("Mulai"))),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
