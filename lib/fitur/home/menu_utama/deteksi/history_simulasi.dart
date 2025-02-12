import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stunting_app/database/histori_db.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/hasil_deteksi.dart';

class HistorySimulasi extends StatefulWidget {
  const HistorySimulasi({super.key});

  @override
  State<HistorySimulasi> createState() => _HistorySimulasiState();
}

class _HistorySimulasiState extends State<HistorySimulasi> {
  Future<List<Map<String, dynamic>>>? historyData;

  Future<List<Map<String, dynamic>>> fetchHistory() async {
    DatabaseHistory dbHistory = DatabaseHistory();
    return await dbHistory.getAllHistory();
  }

  Future<void> exportToExcel(List<Map<String, dynamic>> data) async {
    var excel = Excel.createExcel(); // Buat file Excel baru
    Sheet sheetObject = excel['Sheet1']; // Buat sheet

    // Tambahkan header (opsional)
    if (data.isNotEmpty) {
      sheetObject.appendRow(data.first.keys.toList());
    }
    String formattedDate =
        DateFormat('yyyy-MM-dd_HH_mm_ss').format(DateTime.now());

    // Tambahkan data
    for (var row in data) {
      sheetObject.appendRow(row.values.toList());
    }
    sheetObject.appendRow([]);
    sheetObject.appendRow(['Keterangan:']);
    sheetObject
        .appendRow(['- Usia 241 artinya pengukuran dilakukan secara berdiri']);
    sheetObject.appendRow([
      '- Jenis kelamin 0 artinya laki-laki, sedangkan jenis kelamin 1 artinya perempuan'
    ]);
    sheetObject.appendRow([]);
    sheetObject.appendRow(['Tanggal Export:', formattedDate]);

    // Simpan file Excel ke penyimpanan
    final directory = Directory('/storage/emulated/0/Documents');
    final filePath = '${directory.path}/database_Apedis_$formattedDate.xlsx';
    File(filePath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    print('File Excel berhasil disimpan di $filePath');
    showSuccessDialog(context, filePath);
  }

  Future<void> exportDatabaseToExcel() async {
    final dbHelper = DatabaseHistory();
    final data = await dbHelper.getAllHistory();
    await exportToExcel(data);
    print('Data berhasil diekspor!');
  }

  Future<void> clearHistory() async {
    DatabaseHistory dbHistory = DatabaseHistory();
    await dbHistory.clearHistory();
    setState(() {
      historyData = fetchHistory();
    });
  }

  showDilaogHapus() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hapus Data?'),
            content: Text('Apakah anda yakin untuk menghapus Histori?'),
            actions: [
              TextButton(
                child: Text('Tidak'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text(
                  'Ya',
                  style: const TextStyle(color: Colors.red),
                ),
                onPressed: () async {
                  await clearHistory();
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    historyData = fetchHistory(); // Ambil data dari database saat inisialisasi
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('History Deteksi'),
        actions: [
          IconButton(
            onPressed: () {
              exportDatabaseToExcel();
            },
            icon: Icon(Icons.download),
          ),
          IconButton(
            onPressed: () async {
              showDilaogHapus();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: historyData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child:
                      CircularProgressIndicator()); // Menampilkan loading jika data belum diambil
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Data history tidak ditemukan'));
            } else {
              // Tampilkan ListView jika data ada
              List<Map<String, dynamic>> historyList = snapshot.data!;
              return ListView.separated(
                itemCount: historyList.length,
                itemBuilder: (context, index) {
                  var history = historyList[index];
                  return GestureDetector(
                    onTap: () {
                      print(history['tb']);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HasilDeteksi(
                          kategori: history['kategori_bb'],
                          isFromHistory: true,
                          jenisKelamin: history['jen_kel'],
                          id: history['id'],
                          umur: history['umur'],
                        );
                      }));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    history["nama"].toString().toUpperCase(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Umur: ${history['umur']} bulan"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Berat Badan: ${history['bb']} kg'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Tinggi Badan: ${history['tb']} cm'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Kategori: ${history['kategori_bb']}',
                                    softWrap: true,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Tanggal deteksi: ${history['tgl_deteksi']}',
                                    softWrap: true,
                                    maxLines: 2,
                                  )
                                ],
                              ),
                            ),
                            CircleAvatar(
                              minRadius: 50,
                              maxRadius: 50,
                              backgroundImage:
                                  history['jen_kel'].toString() == '0'
                                      ? AssetImage('assets/images/boy.png')
                                      : AssetImage('assets/images/girl.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

void showSuccessDialog(BuildContext context, String filePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Berhasil'),
        content: Text('File Excel berhasil disimpan di:\n$filePath'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
