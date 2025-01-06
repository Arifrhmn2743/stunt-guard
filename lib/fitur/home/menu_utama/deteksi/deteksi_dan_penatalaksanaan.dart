import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/penatalaksanaan.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/simulasi_stunting.dart';

class DeteksiDanPenatalaksanaan extends StatefulWidget {
  const DeteksiDanPenatalaksanaan({super.key});

  @override
  State<DeteksiDanPenatalaksanaan> createState() =>
      _DeteksiDanPenatalaksanaanState();
}

class _DeteksiDanPenatalaksanaanState extends State<DeteksiDanPenatalaksanaan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deteksi & Penatalaksanaan"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/deteksi.png"),
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
                        leading: Icon(Icons.calculate),
                        title: Text("Deteksi"),
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
                        leading: Icon(Symbols.book),
                        title: Text("Penatalaksanaan"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Penatalaksanaan();
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
