import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:stunting_app/fitur/home/menu_utama/status_gizi/submenu/klasifikasi_gizi.dart';
import 'package:stunting_app/fitur/home/menu_utama/status_gizi/submenu/penanganan_gizi.dart';
import 'package:stunting_app/fitur/home/menu_utama/status_gizi/submenu/pengertian_gizi.dart';
import 'package:stunting_app/fitur/home/menu_utama/status_gizi/submenu/penilaian_gizi.dart';
import 'package:stunting_app/fitur/home/menu_utama/status_gizi/submenu/pola_gizi.dart';

class StatusGizi extends StatefulWidget {
  const StatusGizi({super.key});

  @override
  State<StatusGizi> createState() => _StatusGiziState();
}

class _StatusGiziState extends State<StatusGizi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Status Gizi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/status_gizi.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Icons.question_mark),
                        title: Text("Pengertian"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const PengertianGizi();
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
                        leading: Icon(Symbols.analytics),
                        title: Text("Klasifikasi Gizi"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const KlasifikasiGizi();
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
                        leading: Icon(Symbols.child_care),
                        title: Text("Pola Pemberian Gizi Balita"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const PolaGizi();
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
                        leading: Icon(Symbols.scale),
                        title: Text("Penilaian Status Gizi Anak"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const PenilaianGizi();
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
                        leading: Icon(Symbols.medical_services),
                        title: Text("Penanganan Masalah Gizi"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const PenangananGizi();
                          }));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
