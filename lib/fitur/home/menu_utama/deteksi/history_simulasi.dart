import 'package:flutter/material.dart';
import 'package:stunting_app/database/histori_db.dart';

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
                  print(history["jen_kel"]);
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                history["nama"].toString().toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                              Text('Kategori: ${history['kategori_bb']}')
                            ],
                          ),
                          CircleAvatar(
                            minRadius: 50,
                            maxRadius: 75,
                            backgroundImage:
                                history['jen_kel'].toString() == '0'
                                    ? AssetImage('assets/images/boy.png')
                                    : AssetImage('assets/images/girl.png'),
                          ),
                        ],
                      ),
                    ),
                    // child: ListTile(
                    //   title: Text(history["nama"]),
                    //   subtitle: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text("Umur: ${history['umur']} bulan"),
                    //       Text('Berat Badan: ${history['bb']} kg'),
                    //       Text('Tinggi Badan: ${history['tb']} cm'),
                    //       Text('Kategori: ${history['kategori_bb']}')
                    //     ],
                    //   ),
                    //   trailing:
                    // CircleAvatar(
                    //     minRadius: 50,
                    //     maxRadius: 75,
                    //     backgroundImage: history['jenkel'] == 0
                    //         ? AssetImage('assets/images/boy.png')
                    //         : AssetImage('assets/images/girl.png'),
                    //   ),
                    // ),
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
