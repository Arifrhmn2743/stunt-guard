import 'package:flutter/material.dart';

class PencegahanStunting extends StatefulWidget {
  const PencegahanStunting({super.key});

  @override
  State<PencegahanStunting> createState() => _PencegahanStuntingState();
}

class _PencegahanStuntingState extends State<PencegahanStunting> {
  final List<String> ciriCiri = [
    "Skrining anemia Konsumsi Tablet Tambah Darah (TTD) remaja putri ",
    "Pemeriksaan kehamilan (ANC) ",
    "Konsumsi Tablet Tambah Darah (TTD) ibu hamil ",
    "Pemberian makanan tambahan bagi Ibu Hamil Kurang Energi Kronis (KEK) ",
    "Pemantauan pertumbuhan balita ",
    "ASI eksklusif ",
    "Pemberian MPASI kaya protein hewani bagi baduta (Bawah dua tahun)",
    "Tata laksana balita dengan masalah gizi (Weight faltering, underweight, gizi kurang, gizi buruk dan stunting)",
    "Peningkatan cakupan & perluasan imunisasi ",
    "Edukasi remaja, ibu hamil, dan keluarga termasuk pemicuan bebas Buang Air Besar Sembarangan (BABS)"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pencegahan Stunting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset("assets/images/pencegahan.png"),
              const SizedBox(height: 30),
              ...ciriCiri.asMap().entries.map((entry) {
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
            ],
          ),
        ),
      ),
    );
  }
}
