import 'package:flutter/material.dart';
import 'package:stunting_app/fitur/home/menu_utama/antropomentri/antropomentri.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/history_simulasi.dart';
import 'package:stunting_app/fitur/home/menu_utama/pengertian_stunting/pengertian_stunting.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/simulasi_stunting.dart';
import 'package:stunting_app/fitur/home/menu_utama/status_gizi/status_gizi.dart';
import 'package:stunting_app/fitur/home/menu_utama/tentang/tentang_aplikasi.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/logo_app.png"),
                ),
                const SizedBox(
                  height: 50,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.assignment),
                      title: Text("Stunting"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const PengertianStunting();
                        }));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.bar_chart),
                      title: Text("Status Gizi"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const StatusGizi();
                        }));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.grade),
                      title: Text("Standar Antropometri"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Antropometri();
                        }));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.calculate),
                      title: Text("Deteksi & Penatalaksanaan"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SimulasiStunting();
                        }));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.assignment),
                      title: Text("Histori Deteksi"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HistorySimulasi();
                        }));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.verified_user),
                      title: Text("Tentang Aplikasi"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const TentangAplikasi();
                        }));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return const PengertianStunting();
                //         }));
                //       },
                //       child: const Column(
                //         children: [
                //           Card(
                //             child: Padding(
                //               padding: EdgeInsets.all(16.0),
                //               child: Icon(Icons.assignment),
                //             ),
                //           ),
                //           Text("Stunting")
                //         ],
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return const StatusGizi();
                //         }));
                //       },
                //       child: const Column(
                //         children: [
                //           Card(
                //             child: Padding(
                //               padding: EdgeInsets.all(16.0),
                //               child: Icon(Icons.bar_chart),
                //             ),
                //           ),
                //           Text("Status Gizi")
                //         ],
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return const GrafikZscore();
                //         }));
                //       },
                //       child: const Column(
                //         children: [
                //           Card(
                //             child: Padding(
                //               padding: EdgeInsets.all(16.0),
                //               child: Column(
                //                 children: [
                //                   Icon(Icons.grade),
                //                   Text("Standar Antropometri")
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 50,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return const SimulasiStunting();
                //         }));
                //       },
                //       child: const Column(
                //         children: [
                //           Card(
                //             child: Padding(
                //               padding: EdgeInsets.all(16.0),
                //               child: Icon(Icons.calculate),
                //             ),
                //           ),
                //           Text("Deteksi")
                //         ],
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return const HistorySimulasi();
                //         }));
                //       },
                //       child: const Column(
                //         children: [
                //           Card(
                //             child: Padding(
                //               padding: EdgeInsets.all(16.0),
                //               child: Icon(Icons.calculate),
                //             ),
                //           ),
                //           Text("History\nDeteksi")
                //         ],
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return const TentangAplikasi();
                //         }));
                //       },
                //       child: const Column(
                //         children: [
                //           Card(
                //             child: Padding(
                //               padding: EdgeInsets.all(16.0),
                //               child: Icon(Icons.verified_user),
                //             ),
                //           ),
                //           Text("Tentang\nAplikasi")
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
