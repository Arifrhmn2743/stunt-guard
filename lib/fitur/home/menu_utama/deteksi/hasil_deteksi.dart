import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stunting_app/database/histori_db.dart';
import 'package:stunting_app/fitur/home/homepage.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/simulasi_stunting.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/widget/grafik.dart';

class HasilDeteksi extends StatefulWidget {
  final bool isFromHistory;
  final String kategori;
  final int jenisKelamin, umur;
  final int? id;
  final double? tinggiBadan;
  const HasilDeteksi(
      {super.key,
      required this.kategori,
      required this.isFromHistory,
      required this.jenisKelamin,
      required this.umur,
      this.tinggiBadan,
      this.id});

  @override
  State<HasilDeteksi> createState() => _HasilDeteksiState();
}

class _HasilDeteksiState extends State<HasilDeteksi> {
  List<Map<String, dynamic>> _chartData = [];

  Future<void> loadChartData() async {
    DatabaseHistory dbHelper = DatabaseHistory();

    if (widget.isFromHistory) {
      // Jika data berasal dari history
      if (widget.id != null) {
        try {
          final data =
              await dbHelper.getChartDataById(widget.id!); // Ambil data dari DB
          setState(() {
            _chartData = data;
          });
          print("Data: $_chartData");
        } catch (e) {
          setState(() {});
          debugPrint('Error: $e');
        }
      }
    } else {
      // Jika data berasal dari deteksi baru
      setState(() {
        _chartData = [
          {
            'umur': widget.umur.toDouble(),
            'tb': widget.tinggiBadan!.toDouble(),
            'kategori_bb': widget.kategori,
          }
        ];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Deteksi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  child:
                      widget.kategori == "Normal" || widget.kategori == "Tinggi"
                          ? LottieBuilder.asset(
                              "assets/images/good_job.json",
                              height: 300,
                            )
                          : LottieBuilder.asset(
                              "assets/images/warning.json",
                              height: 300,
                            )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.kategori == "Normal"
                          ? "Anak Anda ${widget.kategori}"
                          : widget.kategori == 'Tinggi'
                              ? "Anak terdeteksi Tinggi"
                              : "Anak Anda ${widget.kategori}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.kategori == "Normal"
                        ? "Berdasarkan hasil perhitungan, anak Anda ${widget.kategori}. Pertumbuhan anak sesuai dengan standar normal untuk usia dan tinggi badannya."
                        : widget.kategori == "Tinggi"
                            ? "Berdasarkan hasil perhitungan, anak Anda termasuk ${widget.kategori}. Pertumbuhan anak agak lebih dari standar normal untuk usia dan tinggi badannya."
                            : "Berdasarkan hasil perhitungan, anak Anda ${widget.kategori}. Ini berarti pertumbuhan anak berada di bawah standar normal untuk usia dan tinggi badannya.",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 300,
                      width: 500,
                      child: ZScoreChart(
                        chartData: _chartData,
                        jenisKelamin: widget.jenisKelamin,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Keterangan:"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Garis biru menunjukkan nilai median dari grafik zscore."),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Garis abu-abu menunjukkan bahwa anak diukur dengan keadaan berdiri."),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Titik merah menunjukkan data tinggi badan anak."),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      if (widget.isFromHistory) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SimulasiStunting();
                        }));
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Ink(
                        height: 41,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Hitung Ulang",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Homepage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Ink(
                        height: 41,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Kembali Ke Home",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
