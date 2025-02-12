import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
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

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // Minta izin jika belum diberikan
      await Permission.storage.request();
    }

    // Untuk Android 11+
    if (await Permission.manageExternalStorage.isDenied) {
      await Permission.manageExternalStorage.request();
    }
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
        child: SingleChildScrollView(
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
                        child: Image.asset("assets/images/ikon_trans.png"),
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
                      height: 200,
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
                        "Universitas Muhammadiyah Purwokerto\nFakultas Ilmu Kesehatan",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
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
                                onPressed: () async {
                                  await requestStoragePermission();
                                  if (pbExists == false) {
                                    insertBeratBadan();
                                    insertPanjangBadan();
                                    if (context.mounted) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const Homepage();
                                      }));
                                    }
                                  } else {
                                    if (context.mounted) {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const Homepage();
                                      }));
                                    }
                                  }
                                },
                                child: const Text("Mulai"))),
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
