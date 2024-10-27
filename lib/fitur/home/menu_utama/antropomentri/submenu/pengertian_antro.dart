import 'package:flutter/material.dart';

class PengertianAntro extends StatefulWidget {
  const PengertianAntro({super.key});

  @override
  State<PengertianAntro> createState() => _PengertianAntroState();
}

class _PengertianAntroState extends State<PengertianAntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengertian"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/images/ukur.jpg'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Standar antropometri anak didasarkan pada parameter berat badan dan panjang tinggi badan, yang terdiri dari 4 (empat) indeks. Termasuk prosedur Indeks PB/U atau TB/U menggambarkan tinggi badan anak atau pertumbuhan tinggi badan menurut umur. Indeks ini dapat mengidentifikasi anak-anak yang pendek (stunted) atau sangat pendek (severely stunted), yang disebabkan oleh gizi kurang dalam waktu lama atau sering sakit",
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
