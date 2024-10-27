import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:stunting_app/fitur/home/menu_utama/antropomentri/submenu/cara_pengukuran.dart';
import 'package:stunting_app/fitur/home/menu_utama/antropomentri/submenu/pengertian_antro.dart';
import 'package:stunting_app/fitur/home/menu_utama/antropomentri/submenu/tabel_standar.dart';

class Antropometri extends StatefulWidget {
  const Antropometri({super.key});

  @override
  State<Antropometri> createState() => _AntropometriState();
}

class _AntropometriState extends State<Antropometri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Standar Antropometri"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/antro.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                            return const PengertianAntro();
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
                        leading: Icon(Symbols.straighten),
                        title: Text("Cara Pengukuran"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const CaraPengukuran();
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
                        leading: Icon(Symbols.data_usage),
                        title: Text("Tabel Standar PB/U"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const TabelStandar();
                          }));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
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
