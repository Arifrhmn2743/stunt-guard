import 'package:flutter/material.dart';

class PengertianGizi extends StatefulWidget {
  const PengertianGizi({super.key});

  @override
  State<PengertianGizi> createState() => _PengertianGiziState();
}

class _PengertianGiziState extends State<PengertianGizi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengertian Status Gizi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset("assets/images/gizi.png"),
              SizedBox(
                height: 30,
              ),
              const Text(
                "Status gizi adalah keadaan yang diakibatkan oleh keseimbangan antara asupan zat gizi dari makanan dengan kebutuhan zat gizi yang diperlukan untuk metabolisme tubuh. Status gizi balita adalah keadaan gizi anak balita umur 0-59 bulan yang ditentukan dengan metode Antropometri, berdasarkan indeks Berat Badan menurut Umur (BB/U), Tinggi Badan mrnurut Umur (TB/U), dan Berat Badan menurut Tinggi Badan (BB/TB).",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
