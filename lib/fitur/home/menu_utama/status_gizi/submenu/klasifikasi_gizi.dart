import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class KlasifikasiGizi extends StatefulWidget {
  const KlasifikasiGizi({super.key});

  @override
  State<KlasifikasiGizi> createState() => _KlasifikasiGiziState();
}

class _KlasifikasiGiziState extends State<KlasifikasiGizi> {
  final bbU = Image.asset('assets/images/tabel_bbu.png').image;
  final tbU = Image.asset('assets/images/tabel_tbu.png').image;
  final bbPB = Image.asset('assets/images/tabel_bbpb.png').image;
  final imtu = Image.asset('assets/images/tabel_imtu.png').image;
  final imptu_2 = Image.asset('assets/images/tabel_imtu_2.png').image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Klasifikasi Gizi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Tabel Status Gizi Berdasarkan Indeks Berat Badan Menurut Umur (BB/U) Anak Usia 0 - 60 Bulan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                  onTap: () {
                    showImageViewer(context, bbU, onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/tabel_bbu.png')),
              const SizedBox(height: 20),
              const Text(
                "Tabel Status Gizi Berdasarkan Indeks Tinggi Badan Menurut Umur (TB/U) Anak Usia 0 - 60 Bulan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                  onTap: () {
                    showImageViewer(context, tbU, onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/tabel_tbu.png')),
              const SizedBox(height: 20),
              const Text(
                "Tabel Status Gizi Berdasarkan Indeks Panjang Badan Menurut Tinggi Badan (BB/PB) Anak Usia 0 - 60 Bulan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                  onTap: () {
                    showImageViewer(context, bbPB, onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/tabel_bbpb.png')),
              const SizedBox(height: 20),
              const Text(
                "Tabel Status Gizi Berdasarkan Indeks Massa Tubuh Menurut Umur (IMT/U) Anak Usia 0 - 60 Bulan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                  onTap: () {
                    showImageViewer(context, imtu, onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/tabel_imtu.png')),
              const SizedBox(height: 20),
              const Text(
                "Tabel Status Gizi Berdasarkan Indeks Massa Tubuh Menurut Umur (IMT/U) Anak Usia 5 - 18 tahun",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                  onTap: () {
                    showImageViewer(context, imptu_2, onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/tabel_imtu_2.png')),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
