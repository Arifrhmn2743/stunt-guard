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
  final List<String> tiga = [
    "Timbangan bayi digunakan untuk menimbang anak sampai umur 2 tahun atau selama anak masih bisa berbaring/duduk tenang.",
    "Letakkan timbangan pada meja yang datar dan tidak mudah bergoyang.",
    "Lihat posisi jarum atau angka harus menunjuk ke angka 0.",
    "Bayi sebaiknya telanjang, tanpa topi, kaus kaki, sarung tangan.",
    "Baringkan bayi dengan hati-hau di atas timbangan.",
    "Lihat jarum timbangan sampai berhenti.",
    "Baca angka yang ditunjukkan oleh jarum timbangan atau angka timbangan.",
    "Bila bayi terus menerus bergerak, perhatikan gerakan jarum, baca angka di tengah-tengah antara gerakan jarum ke kanan dan kekiri.",
  ];
  final List<String> empat = [
    "Letakkan timbangan di lantai yang datar sehingga tidak mudah bergerak.",
    "Lihat posisi jarum atau angka harus menunjuk ke angka 0.",
    "Anak sebaiknya memakai baju sehari-hari yang tipis, tidak memakai alas kaki, jaket, topi, jam tangan, kalung, dan tidak memegang sesuatu.",
    "Anak berdiri di atas timbangan tanpa dipegangi.",
    "Lihat jarum timbangan sampai berhenti.",
    "Baca angka yang ditunjukkan oleh jarum timbangan atau angka timbangan.",
    "Bila anak terus menerus bergerak, perhatikan gerakan jarum, baca angka di tengah-tengah antara gerakan jarum ke kanan dan ke kiri.",
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
              Divider(),
              SizedBox(
                height: 20,
              ),
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
                "Menggunakan Timbangan Bayi",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ...tiga.asMap().entries.map((entry) {
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
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/timbang_tidur.png'),
              SizedBox(
                height: 20,
              ),
              const Text(
                "Menggunakan Timbangan injak (timbangan digital).",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ...empat.asMap().entries.map((entry) {
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
              SizedBox(
                height: 20,
              ),
              Image.asset('assets/images/timbang_diri.png'),
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
