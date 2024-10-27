import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class TabelStandar extends StatefulWidget {
  const TabelStandar({super.key});

  @override
  State<TabelStandar> createState() => _TabelStandarState();
}

class _TabelStandarState extends State<TabelStandar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabel Standar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Tabel Standar Panjang Badan Menurut Umur (PB/U) Anak Laki-Laki Umur 0-24 Bulan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    final imageProvider =
                        Image.asset('assets/images/laki-laki-biasa.png').image;
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/laki-laki-biasa.png')),
              const SizedBox(height: 10),
              const Text(
                "Keterangan: * Pengukuran panjang badan dilakukan dalam keadaan anak telentang",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  "Tabel Standar Tinggi Badan menurut Umur (TB/U) Anak Laki-Laki Umur 24-60 Bulan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    final imageProvider =
                        Image.asset('assets/images/laki-laki24.png').image;
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/laki-laki24.png')),
              const SizedBox(height: 10),
              const Text(
                "Keterangan: * Pengukuran panjang badan dilakukan dalam keadaan anak berdiri",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  "Tabel Standar Panjang Badan Menurut Umur (PB/U) Anak Perempuan Umur 0-24 Bulan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    final imageProvider =
                        Image.asset('assets/images/perempuan1.png').image;
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/perempuan1.png')),
              const SizedBox(height: 10),
              const Text(
                "Keterangan: * Pengukuran panjang badan dilakukan dalam keadaan anak telentang",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  "Tabel Standar Tinggi Badan menurut Umur (TB/U) Anak Perempuan Umur 24-60 Bulan",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    final imageProvider =
                        Image.asset('assets/images/perempuan2.png').image;
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/perempuan2.png')),
              const SizedBox(height: 10),
              const Text(
                "Keterangan: * Pengukuran panjang badan dilakukan dalam keadaan anak telentang",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
