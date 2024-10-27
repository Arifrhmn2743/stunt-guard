import 'package:flutter/material.dart';

class CaraPengukuran extends StatefulWidget {
  const CaraPengukuran({super.key});

  @override
  State<CaraPengukuran> createState() => _CaraPengukuranState();
}

class _CaraPengukuranState extends State<CaraPengukuran> {
  final List<String> satu = [
    "Sebaiknya dilakukan oleh 2 orang.",
    "Bayi dibaringkan telentang pada alas yang datar.",
    "Kepala bayi menempel pada pembatas angka",
    "Petugas 1: kedua tangan memegang kepala bayi agar tetap menempel pada pembatas angka 0 (pembatas kepala). ",
    "Petugas 2: tangan kiri menekan lutut bayi agar lurus, tangan kanan menekan batas kaki ke telapak kaki.",
    "Petugas 2 membaca angka di tepi diluar pengukur.",
    "Jika Anak umur 0-24 bulan diukur berdiri, maka hasil pengukurannya dikoreksi dengan menambahkan 0,7 cm.",
  ];
  final List<String> dua = [
    "Anak tidak memakai sandal atau sepatu.",
    "Berdiri tegak menghadap kedepan.",
    "Punggung, pantat dan tumit menempel pada tiang pengukur.",
    "Turunkan batas atas pengukur sampai menempel di ubun-ubun. Baca angka pada batas tersebut.",
    "Jika anak umur diatas 24 bulan diukur telentang, maka hasil pengukurannya dikoreksi dengan mengurangkan 0,7 cm",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cara Pengukuran"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Pengukuran Tinggi/Panjang Badan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Pengukuran Panjang Badan untuk anak 0-24 bulan. Cara mengukur dengan posisi berbaring:",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ...satu.asMap().entries.map((entry) {
                int index = entry.key;
                String ciri = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}. ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: Text(
                          ciri,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              Image.asset('assets/images/satu.png'),
              SizedBox(
                height: 20,
              ),
              const Text(
                "Pengukuran Tinggi Badan untuk anak 24-72 Bulan. Cara mengukur dengan posisi berdiri:",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ...dua.asMap().entries.map((entry) {
                int index = entry.key;
                String ciri = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}. ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: Text(
                          ciri,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              Image.asset('assets/images/dua.png'),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
