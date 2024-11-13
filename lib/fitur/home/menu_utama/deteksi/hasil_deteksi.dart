import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stunting_app/fitur/home/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class HasilDeteksi extends StatefulWidget {
  final String nama, kategori;
  const HasilDeteksi({super.key, required this.nama, required this.kategori});

  @override
  State<HasilDeteksi> createState() => _HasilDeteksiState();
}

class _HasilDeteksiState extends State<HasilDeteksi> {
  final Uri _url = Uri.parse('https://bit.ly/3AFvN4L');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
                              : "Peringatan: Anak Anda ${widget.kategori}",
                      style: TextStyle(fontSize: 20),
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
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text(
                            "Rekomendasi ahli gizi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            height: 12,
                          ),
                          widget.kategori == "Normal"
                              ? Text(
                                  "Wah, Selamat Bu, Hasil pemeriksaan menunjukkan gizi anak baik, Terus pertahankan ya Bu!")
                              : widget.kategori == "Tinggi"
                                  ? Text(
                                      "Wah, Selamat Bu, Hasil pemeriksaan menunjukkan gizi anak baik, Terus pertahankan ya Bu!")
                                  : Text(
                                      "Perbanyak asupan protein hewani yang mudah diserap anak-anak atau gampang diolah, Seperti: telur, susu tinggi protein/ susu skim (susu tanpa lemak)/ susu yang sesuai usianya. Tambahan lainnya daging-dagingan (daging ayam, daging sapi)"),
                          // Text(widget.kategori != "Normal"
                          //     ? "Pastikan anak mendapatkan asupan gizi yang cukup dan seimbang. "
                          //     : "Rutin periksakan anak ke tenaga kesehatan untuk memantau perkembangan tinggi dan berat badan."),
                          SizedBox(
                            height: 12,
                          ),
                          widget.kategori == "Normal"
                              ? Text(
                                  "Terimakasih sudah rutin membawa anak ke posyandu Bu!")
                              : widget.kategori == "Tinggi"
                                  ? Text(
                                      "Terimakasih sudah rutin membawa anak ke posyandu Bu!")
                                  : Text(
                                      "Segera konsultasikan ke ahli gizi puskesmas terdekat"),
                          SizedBox(
                            height: 20,
                          ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       border: Border.all(),
                          //       borderRadius: BorderRadius.circular(20),
                          //       color: Theme.of(context).colorScheme.tertiary),
                          //   child: ListTile(
                          //     title: Text(
                          //       "Tekan disini untuk melihat info selengkapnya",
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //     trailing: Icon(
                          //       Icons.arrow_forward_ios,
                          //       color: Colors.white,
                          //     ),
                          //     onTap: () {},
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 12,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text(
                            "Anjuran Penatalaksanaan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            height: 12,
                          ),
                          Text(widget.kategori == "Normal" ||
                                  widget.kategori == "Tinggi"
                              ? "Tetap pertahankan pola makan yang sehat dan bergizi untuk mendukung pertumbuhan anak secara optimal."
                              : "Konsultasikan segera dengan tenaga kesehatan atau dokter anak untuk mendapatkan penanganan lebih lanjut. "),
                          SizedBox(
                            height: 12,
                          ),
                          widget.kategori == "Normal" ||
                                  widget.kategori == "Tinggi"
                              ? SizedBox.shrink()
                              : Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  child: ListTile(
                                    title: Text(
                                      "Tekan disini untuk melihat rekomendasi cegah stunting dari Kementrian Kesehatan",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) {
                                      //   return WebviewLink();
                                      // }));
                                      _launchUrl();
                                    },
                                  ),
                                ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
