import 'package:flutter/material.dart';
import 'package:stunting_app/database/bbb_u_db.dart';
import 'package:stunting_app/database/list_data/list_pb_u.dart';
import 'package:stunting_app/database/pb_u_db.dart';
import 'package:stunting_app/fitur/home/homepage.dart';
import 'package:stunting_app/database/list_data/list_data_bb.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool? pbExists, bbExist;
  Future<void> insertBeratBadan() async {
    final DatabaseBBUHelper databaseBBUHelper = DatabaseBBUHelper();
    for (var data in beratBadanList) {
      await databaseBBUHelper.insertBeratBadan(
        data['umur'],
        data['jenkel'],
        data['sd_neg_3'],
        data['sd_neg_2'],
        data['sd_neg_1'],
        data['median'],
        data['sd_pos_1'],
        data['sd_pos_2'],
        data['sd_pos_3'],
      );
    }
    List<Map<String, dynamic>> allData =
        await databaseBBUHelper.getAllBeratBadan();
    print("Data dalam tabel bbu:");
    for (var row in allData) {
      print(row);
    }
  }

  Future<void> insertPanjangBadan() async {
    final DatabasePBUHelper databasePBUHelper = DatabasePBUHelper();
    for (var data in panjangBadanList) {
      await databasePBUHelper.insertPanjangBadan(
        data['umur'],
        data['jenkel'],
        data['sd_neg_3'],
        data['sd_neg_2'],
        data['sd_neg_1'],
        data['median'],
        data['sd_pos_1'],
        data['sd_pos_2'],
        data['sd_pos_3'],
      );
    }
    List<Map<String, dynamic>> allData =
        await databasePBUHelper.getAllPanjangBadan();
    print("Data dalam tabel pbu:");
    for (var row in allData) {
      print(row);
    }
  }

  void checkDbExsist() async {
    final dbHelper1 = DatabaseBBUHelper();
    final dbHelper2 = DatabasePBUHelper();
    bbExist = await dbHelper1.checkBeratBadanExist(0);
    pbExists = await dbHelper2.checkPanjangBadanExist(0);
    print(bbExist);
  }

  @override
  void initState() {
    checkDbExsist();
    super.initState();
  }

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
                  Center(
                    child: Text(
                      "Aplikasi ini disusun oleh:",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Gita Wulandari",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Dengan bimbingan:",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Ns. Tina Muzaenah, S.Kep., M.Kep.",
                      style: TextStyle(fontSize: 16),
                    ),
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
                  Center(
                    child: Text(
                      "Universitas Muhammadiyah Purwokerto, Fakultas Ilmu Kesehatan",
                      style: TextStyle(fontSize: 16),
                    ),
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
                                if (pbExists == false) {
                                  insertBeratBadan();
                                  insertPanjangBadan();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const Homepage();
                                  }));
                                } else {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const Homepage();
                                  }));
                                }
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
